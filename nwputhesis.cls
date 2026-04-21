\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{nwputhesis}
[2026/03/25 v2.2.0 nwputhesis]
\input{nwputhesis/nwputhesis-options.def}
\LoadClass[11pt, a4paper, openany]{book}                    % 本科单面印刷，硕博双面印刷
\if@npu@type@bcl
    \@twosidefalse\@mparswitchfalse                         % 本科强制单面印刷
\fi
\RequirePackage{etoolbox}                                   % LaTeX 补丁工具
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{%
    \cleardoublepage
}{}{\errmessage{failed to patch chapter pagination}}
\input{nwputhesis/nwputhesis-core.def}
\input{nwputhesis/nwputhesis-fonts.def}
\input{nwputhesis/nwputhesis-layout.def}
\input{nwputhesis/nwputhesis-localization.def}
\input{nwputhesis/nwputhesis-metadata.def}
\input{nwputhesis/nwputhesis-title.def}
\input{nwputhesis/nwputhesis-abstract.def}
\input{nwputhesis/nwputhesis-bibliography.def}
\input{nwputhesis/nwputhesis-appendix.def}
\input{nwputhesis/nwputhesis-backmatter.def}
\@npu@class@loadedtrue
