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
if latexmk "${LATEXMK_ARGS[@]}"; then
    echo "=========================================="
    echo "✓ Compilation successful!"
    echo "=========================================="
    
    # Copy PDF to root directory with proper name
    OUTPUT_PDF="$OUTPUT_DIR/output.pdf"
    TARGET_PDF="$SCRIPT_DIR/$BASENAME.pdf"
    
    if [ -f "$OUTPUT_PDF" ]; then
        cp "$OUTPUT_PDF" "$TARGET_PDF"
        echo "PDF copied to: $TARGET_PDF"
    fi
else
    EXIT_CODE=$?
    echo "=========================================="
    echo "✗ Compilation failed (exit code: $EXIT_CODE)"
    echo "Check $OUTPUT_DIR/output.log for details"
    echo "=========================================="
    
    # Remove old PDF to indicate failure
    TARGET_PDF="$SCRIPT_DIR/$BASENAME.pdf"
    [ -f "$TARGET_PDF" ] && rm "$TARGET_PDF"
    
    exit $EXIT_CODE
fi
