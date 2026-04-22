\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{nwputhesis}
[2026/03/25 v2.2.0 nwputhesis]
\input{nwputhesis/nwputhesis-options.def}
\LoadClass[a4paper]{book}                                   % openright 默认：硕博双面从奇数页起排
\ExplSyntaxOn
\nwpu_if_bachelor:T { \@twosidefalse \@mparswitchfalse }    % 本科强制单面印刷
\ExplSyntaxOff
\input{nwputhesis/nwputhesis-format-constants.def}
\input{nwputhesis/nwputhesis-core.def}
\input{nwputhesis/nwputhesis-fonts.def}
\input{nwputhesis/nwputhesis-layout.def}
%%-----------------------------------------------------------------------------%
%% hyperref 应尽可能靠后加载，但需早于使用其命令的 localization.def
%%-----------------------------------------------------------------------------%
\RequirePackage[                                            % 超链接设置
    unicode=true,                                           % 允许 Unicode
    colorlinks=false,                                       % 不改变文字颜色
    pdfborder={0 0 0},                                      % 不显示边框
    bookmarks=true]{hyperref}                               % 显示书签页
\hypersetup{                                                % Acrobat 默认设置
    pdftoolbar=true,                                        % 显示工具栏
    pdfmenubar=true,                                        % 显示菜单栏
    pdffitwindow=true,                                      % 缩放以适应窗口大小
    pdfstartview={FitH},                                    % 适合窗口宽度
    pdfnewwindow=true,                                      % 以新窗口打开链接
    hypertexnames=false,                                    % 避免重复页锚点命名
}                                                           %
\special{pdf:minorversion 7}                                % 允许包含 PDF 1.7 页面
\RequirePackage{bookmark}                                   %
\pdfstringdefDisableCommands{%                              % 解决 "Token not allowed in a PDF string" 警告
\def\!{}%
\def\quad{ }%
\def\qquad{  }%
}
\input{nwputhesis/nwputhesis-localization.def}
\input{nwputhesis/nwputhesis-metadata.def}
\input{nwputhesis/nwputhesis-title.def}
\input{nwputhesis/nwputhesis-abstract.def}
\input{nwputhesis/nwputhesis-bibliography.def}
\input{nwputhesis/nwputhesis-appendix.def}
\input{nwputhesis/nwputhesis-backmatter.def}
\ExplSyntaxOn
\bool_set_true:N \l__nwpu_class_loaded_bool
\ExplSyntaxOff
