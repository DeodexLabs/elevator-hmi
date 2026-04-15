#!/usr/bin/env bash
# =============================================================
# scripts/convert-library.sh
# Converts all PDFs in library/ to Markdown using markitdown.
# Run once (and re-run whenever new PDFs are added to library/).
# Owned by Claude Code (A1).
# =============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LIBRARY_DIR="$REPO_ROOT/library"

echo "==> Elevator HMI — Library PDF → Markdown conversion"
echo "    Library path: $LIBRARY_DIR"
echo ""

# ------------------------------------------------------------
# 1. Ensure markitdown is installed
# ------------------------------------------------------------
if ! python3 -c "import markitdown" 2>/dev/null; then
  echo "==> markitdown not found. Installing..."
  pip3 install markitdown --break-system-packages --quiet
  echo "==> markitdown installed."
else
  echo "==> markitdown already installed."
fi

# ------------------------------------------------------------
# 2. Find all PDFs
# ------------------------------------------------------------
PDF_COUNT=$(find "$LIBRARY_DIR" -maxdepth 1 -name "*.pdf" | wc -l)

if [ "$PDF_COUNT" -eq 0 ]; then
  echo ""
  echo "ERROR: No PDF files found in $LIBRARY_DIR"
  echo "       Place vendor PDFs in library/ and re-run this script."
  exit 1
fi

echo ""
echo "==> Found $PDF_COUNT PDF(s) to convert:"
find "$LIBRARY_DIR" -maxdepth 1 -name "*.pdf" | sort | while read -r f; do
  echo "    $(basename "$f")"
done
echo ""

# ------------------------------------------------------------
# 3. Convert each PDF
# ------------------------------------------------------------
SUCCESS=0
FAILED=0
SKIPPED=0

find "$LIBRARY_DIR" -maxdepth 1 -name "*.pdf" | sort | while read -r pdf_path; do
  basename_noext="${pdf_path%.pdf}"
  md_path="${basename_noext}.md"
  pdf_name="$(basename "$pdf_path")"
  md_name="$(basename "$md_path")"

  # Skip if already converted and PDF is not newer
  if [ -f "$md_path" ] && [ "$md_path" -nt "$pdf_path" ]; then
    echo "  [SKIP]    $pdf_name  →  $md_name  (up to date)"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  printf "  [CONVERT] %-55s →  %s ... " "$pdf_name" "$md_name"

  if python3 -m markitdown "$pdf_path" -o "$md_path" 2>/dev/null; then
    line_count=$(wc -l < "$md_path")
    echo "OK  (${line_count} lines)"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "FAILED"
    FAILED=$((FAILED + 1))
    # Remove empty/partial output if conversion failed
    [ -f "$md_path" ] && rm -f "$md_path"
  fi
done

# ------------------------------------------------------------
# 4. Summary
# ------------------------------------------------------------
echo ""
echo "==> Conversion complete."
echo "    Converted : $SUCCESS"
echo "    Skipped   : $SKIPPED (already up to date)"
echo "    Failed    : $FAILED"
echo ""

if [ "$FAILED" -gt 0 ]; then
  echo "WARNING: $FAILED file(s) failed to convert."
  echo "         Check if the PDF is scanned/image-only (markitdown cannot OCR)."
  echo "         Options: use OCR tool (tesseract), or manually extract key sections."
  echo ""
fi

# ------------------------------------------------------------
# 5. List generated markdown files
# ------------------------------------------------------------
echo "==> Generated Markdown files in library/:"
find "$LIBRARY_DIR" -maxdepth 1 -name "*.md" ! -name "README.md" | sort | while read -r f; do
  size=$(wc -c < "$f")
  lines=$(wc -l < "$f")
  printf "    %-55s  %6d lines  %7d bytes\n" "$(basename "$f")" "$lines" "$size"
done

echo ""
echo "==> Next step for A1:"
echo "    git add library/*.md"
echo "    git commit -m '[phase0][library] convert vendor PDFs to markdown for agent access'"
