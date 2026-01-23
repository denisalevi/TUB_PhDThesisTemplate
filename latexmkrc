# latexmkrc - Overleaf-compatible LaTeX build configuration
# For TU Berlin PhD Thesis Template

# ============================================================================
# Environment settings
# ============================================================================
# Set timezone (dates in PDF will use this timezone)
$ENV{'TZ'} = 'Europe/Berlin';

# ============================================================================
# Compilation engine
# ============================================================================
# Use pdflatex to generate PDF directly
$pdf_mode = 1;          # 1 = pdflatex, 4 = lualatex, 5 = xelatex
$postscript_mode = 0;   # Don't use latex -> dvips -> ps2pdf
$dvi_mode = 0;          # Don't generate DVI

# ============================================================================
# Bibliography: biblatex with biber
# ============================================================================
$bibtex_use = 2;        # Use biber when .bbl file is out of date
$biber = 'biber %O %S';

# ============================================================================
# Custom paths for class and style files
# ============================================================================
# Add Classes/ directory where PhDthesisTUB.cls and other files live
ensure_path('TEXINPUTS', './Classes//');
ensure_path('BSTINPUTS', './Classes//');

# ============================================================================
# Enable shell-escape for minted, pgfplots externalization, etc.
# ============================================================================
set_tex_cmds('-shell-escape %O %S');

# ============================================================================
# Glossaries support
# ============================================================================
# Your thesis uses \makeglossaries and \printglossary
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  my ($base_name) = @_;
  if ( $silent ) {
    my $ret = system "makeglossaries -q '$base_name'";
  } else {
    my $ret = system "makeglossaries '$base_name'";
  };
  return $ret;
}

# Clean glossary files when running latexmk -c or -C
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'syg', 'sls', 'slg';  # Symbol glossary
$clean_ext .= ' %R.ist %R.xdy run.xml';

# ============================================================================
# Overleaf behavior: continue despite errors
# ============================================================================
# This matches Overleaf's default "try to compile despite errors" mode
$force_mode = 1;

# ============================================================================
# Compilation settings
# ============================================================================
# Maximum number of compilation runs
$max_repeat = 5;

# Allow creation of subdirectories in output directory (needed for tikzexternalize)
$allow_subdir_creation = 2;

# Use nonstopmode (matches Overleaf default)
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape %O %S';

# ============================================================================
# Preview settings (for local use with latexmk -pvc)
# ============================================================================
# Uncomment and adjust for your PDF viewer
# $pdf_previewer = 'start evince';  # Linux
# $pdf_previewer = 'open -a Preview'; # macOS
# $pdf_previewer = 'start';  # Windows

# ============================================================================
# Output directory (keep disabled for Overleaf compatibility)
# ============================================================================
# Do NOT set $out_dir - Overleaf doesn't support it and it breaks previews
# All auxiliary files will be generated in the same directory as thesis.tex
