# latexmk configuration for nwputhesis
$pdf_mode = 5;  # 5 = xelatex mode

# Allow overriding fontset via environment variable (used in CI)
my $fontset_opt = '';
if (defined $ENV{'NWPU_FONTSET'}) {
    $fontset_opt = "\\PassOptionsToClass{fontset=$ENV{'NWPU_FONTSET'}}{nwputhesis} ";
}
$xelatex = "xelatex -synctex=1 -interaction=nonstopmode -file-line-error ${fontset_opt}%O %S";
