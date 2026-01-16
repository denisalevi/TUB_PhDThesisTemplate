# Compilation Guide

This thesis uses `latexmk` for compilation, matching Overleaf's behavior exactly.

## Quick Start

### Local Compilation

**Simple compile:**
```bash
./compile.sh
```

**Continuous preview mode** (recompiles on save):
```bash
./compile.sh -pvc thesis.tex
```

**Clean auxiliary files:**
```bash
latexmk -C
rm -rf output/
```

### On Overleaf

1. Upload the entire `latex/` folder to Overleaf
2. Set **Main document** to `thesis.tex` in Menu → Settings
3. Click Recompile

## File Organization

**Local compilation:**
```
latex/
├── thesis.tex              # Main document
├── thesis.pdf              # Output (copied from output/)
├── latexmkrc              # Build configuration (Overleaf-compatible)
├── compile.sh             # Compilation script (local only)
├── output/                # Auxiliary files (gitignored)
│   ├── output.pdf         # Actual compiled PDF
│   ├── output.aux
│   ├── output.log
│   └── ...
└── [all other files]
```

**On Overleaf:**
```
latex/
├── thesis.tex              # Main document
├── output.pdf              # Output (Overleaf names it this way)
├── output.aux, output.log  # Auxiliary files (in root)
├── latexmkrc              # Build configuration
└── [all other files]
```

## How It Works

### Local (with output directory)

The `compile.sh` script:
1. Uses `-outdir=output` to put all files in `output/` folder
2. Uses `-jobname=output` so PDF is named `output.pdf`
3. Copies `output/output.pdf` → `thesis.pdf` in root
4. Keeps your workspace clean!

### On Overleaf (no output directory)

Overleaf:
1. Ignores the `compile.sh` script
2. Uses the `latexmkrc` configuration
3. Compiles directly (files in root)
4. Names output as `output.pdf`, `output.aux`, etc.

**The `latexmkrc` is identical** in both cases - that's the key to compatibility!

## VSCode Integration

If using LaTeX Workshop extension:

1. The `.latexmain` file tells VSCode which is the main document
2. Settings in `.vscode/settings.json` use the compile script
3. Build with: `Ctrl+Alt+B` or command palette → "LaTeX Workshop: Build"

## Direct latexmk Usage

You can also call `latexmk` directly (no output directory):

```bash
cd latex/
latexmk thesis.tex        # Compile (files in current directory)
latexmk -pvc thesis.tex   # Continuous preview
latexmk -c thesis.tex     # Clean auxiliary files
latexmk -C thesis.tex     # Clean everything including PDF
```

## Requirements

- `latexmk` (should be part of your TeX distribution)
- `biber` for bibliography: `sudo pacman -S biber`
- `makeglossaries` for glossaries (part of TeX Live)

## Troubleshooting

**"biber: command not found":**
```bash
sudo pacman -S biber
```

**Bibliography not showing up:**
```bash
# Run biber manually then recompile
cd latex/output/
biber output
cd ..
./compile.sh
```

**Compilation errors:**
- Check `output/output.log` for details
- Try cleaning: `rm -rf output/` then recompile

**On Overleaf:**
- Check compiler logs in Overleaf interface
- Make sure main document is set to `thesis.tex`
- Verify all required packages are available in your TeX Live version
