# latexmk configuration for nwputhesis
$pdf_mode = 5;  # 5 = xelatex mode

# Allow overriding fontset via environment variable (used in CI)
if (defined $ENV{'NWPU_FONTSET'}) {
    my $fontset = $ENV{'NWPU_FONTSET'};
    $xelatex = "xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O \"\\PassOptionsToClass{fontset=${fontset}}{nwputhesis} \\input{%S}\"";
} else {
    $xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
}
