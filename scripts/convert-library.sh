#!/usr/bin/env bash
# =============================================================
# scripts/convert-library.sh
# Converts all PDFs in library/ (and subdirectories) to Markdown
# using markitdown.
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
if ! python3 -c "import markitdown" 2>/dev/null || ! python3 -c "from markitdown._markitdown import PdfConverter" 2>/dev/null; then
  echo "==> markitdown[pdf] not found. Installing..."
  pip3 install "markitdown[pdf]" --break-system-packages --quiet
  echo "==> markitdown[pdf] installed."
else
  echo "==> markitdown[pdf] already installed."
fi

# ------------------------------------------------------------
# 2. Find all PDFs (recursive — library/ has subdirectories)
# ------------------------------------------------------------
PDF_COUNT=$(find "$LIBRARY_DIR" -name "*.pdf" | wc -l)

if [ "$PDF_COUNT" -eq 0 ]; then
  echo ""
  echo "ERROR: No PDF files found in $LIBRARY_DIR"
  echo "       Place vendor PDFs in library/ and re-run this script."
  exit 1
fi

echo ""
echo "==> Found $PDF_COUNT PDF(s) to convert:"
find "$LIBRARY_DIR" -name "*.pdf" | sort | while read -r f; do
  echo "    ${f#$LIBRARY_DIR/}"
done
echo ""

# ------------------------------------------------------------
# 3. Convert each PDF
# ------------------------------------------------------------
SUCCESS=0
FAILED=0
SKIPPED=0
FAILED_FILES=""

while IFS= read -r pdf_path; do
  basename_noext="${pdf_path%.pdf}"
  md_path="${basename_noext}.md"
  pdf_name="${pdf_path#$LIBRARY_DIR/}"
  md_name="${md_path#$LIBRARY_DIR/}"

  # Skip if already converted and PDF is not newer
  if [ -f "$md_path" ] && [ "$md_path" -nt "$pdf_path" ]; then
    echo "  [SKIP]    $pdf_name  (up to date)"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  printf "  [CONVERT] %-60s ... " "$pdf_name"

  if python3 -m markitdown "$pdf_path" -o "$md_path" 2>/dev/null; then
    line_count=$(wc -l < "$md_path")
    echo "OK  (${line_count} lines)"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "FAILED"
    FAILED=$((FAILED + 1))
    FAILED_FILES="$FAILED_FILES\n  - $pdf_name"
    # Remove empty/partial output if conversion failed
    [ -f "$md_path" ] && rm -f "$md_path"
  fi
done < <(find "$LIBRARY_DIR" -name "*.pdf" | sort)

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
  echo "Failed files:$FAILED_FILES"
  echo ""
fi

# ------------------------------------------------------------
# 5. List generated markdown files
# ------------------------------------------------------------
echo "==> Generated Markdown files in library/:"
find "$LIBRARY_DIR" -name "*.md" ! -name "README.md" | sort | while read -r f; do
  size=$(wc -c < "$f")
  lines=$(wc -l < "$f")
  printf "    %-60s  %6d lines  %7d bytes\n" "${f#$LIBRARY_DIR/}" "$lines" "$size"
done

echo ""
echo "==> Next step for A1:"
echo "    git add library/"
echo "    git commit -m '[phase0][library] convert vendor PDFs to markdown for agent access'"
