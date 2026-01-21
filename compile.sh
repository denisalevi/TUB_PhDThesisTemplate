#!/bin/bash
# Compile LaTeX with output directory (local only)
# On Overleaf: Just set main document in settings and compile normally
# Based on https://github.com/overleaf/clsi

USAGE="USAGE: compile.sh [-pvc] [filename]
    where
       -pvc      - preview document and continuously update
       filename  - the root filename of LaTeX document (default: thesis.tex)

Examples:
    ./compile.sh                    # compile thesis.tex
    ./compile.sh thesis.tex         # same
    ./compile.sh -pvc thesis.tex    # continuous preview mode
"

# Default values
PVC=""
TARGET="thesis.tex"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -pvc)
            PVC="-pvc"
            shift
            ;;
        -h|--help)
            echo "$USAGE"
            exit 0
            ;;
        *.tex)
            TARGET="$1"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "$USAGE"
            exit 1
            ;;
    esac
done

# Get directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Extract basename without extension
BASENAME=$(basename "$TARGET" .tex)

# Output directory for auxiliary files
OUTPUT_DIR="$SCRIPT_DIR/output"
mkdir -p "$OUTPUT_DIR"

# Target PDF in root directory
TARGET_PDF="$SCRIPT_DIR/$BASENAME.pdf"
OUTPUT_PDF="$OUTPUT_DIR/output.pdf"

# If target PDF is missing but output PDF exists, remove output PDF to trigger fresh compilation
if [ ! -f "$TARGET_PDF" ] && [ -f "$OUTPUT_PDF" ]; then
    echo "Target PDF missing but output PDF exists - forcing recompilation"
    rm -f "$OUTPUT_PDF"
    # Also remove auxiliary files to ensure clean rebuild
    rm -f "$OUTPUT_DIR/output.aux"
    rm -f "$OUTPUT_DIR/output.fdb_latexmk"
fi

# Latexmk arguments matching Overleaf's behavior
# Use -jobname=output so latexmkrc works correctly (expects output.pdf)
LATEXMK_ARGS=(
    -cd                              # Change to directory of main file
    -f                               # Force mode (continue on errors)
    -jobname=output                  # Name output files as "output.*"
    -auxdir="$OUTPUT_DIR"            # Auxiliary files to output/
    -outdir="$OUTPUT_DIR"            # PDF to output/
    -synctex=1                       # Enable synctex for editor sync
    -interaction=nonstopmode         # Don't stop for errors
    -shell-escape                    # Enable shell escape (for tikz, etc.)
    -pdf                             # Generate PDF
    $PVC                             # Add -pvc if specified
    "$TARGET"
)

echo "=========================================="
echo "Compiling $TARGET"
echo "Output directory: $OUTPUT_DIR"
echo "=========================================="

# Run latexmk
EXIT_CODE=0
latexmk "${LATEXMK_ARGS[@]}" || EXIT_CODE=$?

# Check for actual errors (exit codes other than 0 or 12)
# Exit code 12 means "nothing to do" which is success
if [ $EXIT_CODE -eq 0 ] || [ $EXIT_CODE -eq 12 ]; then
    echo "=========================================="
    echo "✓ Compilation successful!"
    [ $EXIT_CODE -eq 12 ] && echo "  (up-to-date, no changes needed)"
    echo "=========================================="
    
    # Copy PDF to root directory with proper name
    if [ -f "$OUTPUT_PDF" ]; then
        cp "$OUTPUT_PDF" "$TARGET_PDF"
        echo "PDF copied to: $TARGET_PDF"
    else
        echo "Warning: $OUTPUT_PDF not found"
        exit 1
    fi
else
    echo "=========================================="
    echo "✗ Compilation failed (exit code: $EXIT_CODE)"
    echo "Check $OUTPUT_DIR/output.log for details"
    echo "=========================================="
    
    # Remove old PDF to indicate failure
    [ -f "$TARGET_PDF" ] && rm "$TARGET_PDF"
    
    exit $EXIT_CODE
fi
