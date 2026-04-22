# latexmk configuration for nwputhesis
$pdf_mode = 5;  # 5 = xelatex mode
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
