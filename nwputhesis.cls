%% Copyright (C) 2022 by Shangkun Shen
%% Modified (C) 2026 by Jiayi Yan
%%
%% This work is licensed under the GNU General Public License v3.
%% You may distribute and/or modify it under the terms of the GPL v3.
%% See LICENSE file for details.
%%
%% 原项目: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis
%% 本项目: https://github.com/1195343015/nwputhesis
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{nwputhesis}
[2026/03/25 v2.2.0 nwputhesis]
%%=============================================================================%
%% 文档选项和基础文档类型控制
%%-----------------------------------------------------------------------------%
\newif\if@npu@lang@chs                                      % 中文版本标记
\newif\if@npu@type@phd                                      % 博士版本标记
\newif\if@npu@type@mst                                      % 硕士版本标记
\newif\if@npu@type@bcl                                      % 本科版本标记
\newif\if@npu@academic                                      % 学术学位标记
\newif\if@npu@output@blindreview                            % 盲评版本标记
\newif\if@npu@font@adobe                                    % Adobe 字体标记
\newif\if@npu@font@winfonts                                 % 强制使用 Win 字体
\newif\if@npu@font@fandol                                   % 强制使用 Fandol 字体
\newif\if@npu@font@local                                    % 使用本地 fonts 目录字体
\newif\if@npu@using@fandol                                  % 实际使用 Fandol 字体标记
\newif\if@npu@colorcover                                    % 彩色封面封底标记
\def\nwpu@bibstyle{gb7714-2015}                             % 默认参考文献标准
\@npu@lang@chstrue
\@npu@type@phdtrue
\@npu@academictrue
\ExplSyntaxOn
\tl_new:N \l__nwpu_option_value_tl
\cs_new_protected:Npn \nwpu_legacy_bool_set:nn #1#2
  {
    \tl_set:Nx \l__nwpu_option_value_tl {#2}
    \str_case:VnF \l__nwpu_option_value_tl
      {
        { true }  { \use:c { @npu@#1true } }
        { false } { \use:c { @npu@#1false } }
      }
      {
        \ClassError { nwputhesis }
          { Unsupported~value~`\tl_use:N \l__nwpu_option_value_tl'~for~boolean~option~`#1' }
          { Boolean~options~only~support~true~and~false. }
      }
  }
\cs_new_protected:Npn \nwpu_lang_set:n #1
  {
    \tl_set:Nx \l__nwpu_option_value_tl {#1}
    \str_case:VnF \l__nwpu_option_value_tl
      {
        { chs } { \@npu@lang@chstrue }
        { eng } { \@npu@lang@chsfalse }
      }
      {
        \ClassError { nwputhesis } { Unsupported~language~`\tl_use:N \l__nwpu_option_value_tl' }
          { Supported~lang~values~are~chs~and~eng. }
      }
  }
\cs_new_protected:Npn \nwpu_degree_set:n #1
  {
    \tl_set:Nx \l__nwpu_option_value_tl {#1}
    \str_case:VnF \l__nwpu_option_value_tl
      {
        { phd }      { \@npu@type@phdtrue  \@npu@type@mstfalse \@npu@type@bclfalse }
        { master }   { \@npu@type@phdfalse \@npu@type@msttrue  \@npu@type@bclfalse }
        { bachelor } { \@npu@type@phdfalse \@npu@type@mstfalse \@npu@type@bcltrue  }
      }
      {
        \ClassError { nwputhesis } { Unsupported~degree~`\tl_use:N \l__nwpu_option_value_tl' }
          { Supported~degree~values~are~phd,~master~and~bachelor. }
      }
  }
\cs_new_protected:Npn \nwpu_bibstyle_set:n #1
  {
    \tl_set:Nx \l__nwpu_option_value_tl {#1}
    \str_case:VnF \l__nwpu_option_value_tl
      {
        { 2015 } { \def\nwpu@bibstyle{gb7714-2015} }
        { 2025 } { \def\nwpu@bibstyle{gb7714-2025} }
      }
      {
        \ClassError { nwputhesis } { Unsupported~bibstyle~`\tl_use:N \l__nwpu_option_value_tl' }
          { Supported~bibstyle~values~are~2015~and~2025. }
      }
  }
\cs_new_protected:Npn \nwpu_fontset_set:n #1
  {
    \tl_set:Nx \l__nwpu_option_value_tl {#1}
    \@npu@font@adobefalse
    \@npu@font@winfontsfalse
    \@npu@font@fandolfalse
    \@npu@font@localfalse
    \str_case:VnF \l__nwpu_option_value_tl
      {
        { auto }    { }
        { fandol }  { \@npu@font@fandoltrue }
        { windows } { \@npu@font@winfontstrue }
        { adobe }   { \@npu@font@adobetrue }
        { local }   { \@npu@font@localtrue }
      }
      {
        \ClassError { nwputhesis } { Unsupported~fontset~`\tl_use:N \l__nwpu_option_value_tl' }
          { Supported~fontset~values~are~auto,~fandol,~windows,~adobe~and~local. }
      }
  }
\DeclareKeys [ nwputhesis ]
  {
    lang        .code:n    = \nwpu_lang_set:n {#1},
    degree      .code:n    = \nwpu_degree_set:n {#1},
    bibstyle    .code:n    = \nwpu_bibstyle_set:n {#1},
    blindreview .code:n    = \nwpu_legacy_bool_set:nn { output@blindreview } {#1},
    blindreview .default:n = true,
    adobe       .code:n    = \nwpu_legacy_bool_set:nn { font@adobe } {#1},
    adobe       .default:n = true,
    winfonts    .code:n    = \nwpu_legacy_bool_set:nn { font@winfonts } {#1},
    winfonts    .default:n = true,
    localfonts  .code:n    = \nwpu_legacy_bool_set:nn { font@local } {#1},
    localfonts  .default:n = true,
    fontset     .code:n    = \nwpu_fontset_set:n {#1},
    academic    .code:n    = \nwpu_legacy_bool_set:nn { academic } {#1},
    academic    .default:n = true,
    colorcover  .code:n    = \nwpu_legacy_bool_set:nn { colorcover } {#1},
    colorcover  .default:n = true,
    unknown     .code:n    = \PassOptionsToClass { \CurrentOption } { book },
  }
\ProcessKeyOptions [ nwputhesis ]
\ExplSyntaxOff
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
\input{nwputhesis/nwputhesis-title.def}
\input{nwputhesis/nwputhesis-abstract.def}
\input{nwputhesis/nwputhesis-bibliography.def}
\input{nwputhesis/nwputhesis-backmatter.def}
