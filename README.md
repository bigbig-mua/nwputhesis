# NwpuThesis

[![Test](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml/badge.svg)](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

本模板已成功通过学校的论文最终版提交（26届硕士），是截至目前（26年3月）已知所有西北工业大学硕博学位论文 LaTeX 模板中最新最完善的，现已添加本科毕业设计论文支持。

本模板格式符合 2025 年西北工业大学研究生院编写的 [西北工业大学研究生学位论文写作指南](https://gs.nwpu.edu.cn/info/2283/30467.htm)。

本科论文格式符合 26 届最新要求，参考 [西北工业大学本科毕业设计（论文）撰写规范](https://jiaowu.nwpu.edu.cn/info/1160/24598.htm)。

## 目录

- [使用说明](#使用说明)
  - [环境说明](#环境说明)
  - [LaTeX 新手指南](#latex-新手指南)
  - [编译方式](#编译方式)
  - [论文格式设置](#论文格式设置)
  - [文件修改说明](#文件修改说明)
- [格式说明](#格式说明)
  - [字体说明（Windows 用户无需关注）](#字体说明windows-用户无需关注)
  - [参考文献格式](#参考文献格式)
- [推荐项目](#推荐项目)
- [许可证](#许可证)

## 使用说明

### 环境说明

#### 本地运行
- 推荐直接下载 [最新 Release 版本](https://github.com/1195343015/nwputhesis/releases/latest) 使用。
- 支持各种操作系统，推荐在 TeX Live 环境下搭配 VS Code 中的 LaTeX Workshop 插件使用。

#### 在线运行
推荐使用 [TeXPage 模板](https://www.texpage.com/zh/template/1b72a41e-0d62-430e-8678-d697d89bdb7e/) 在线编辑。（不推荐使用 Overleaf，其免费版基本没法用）

### LaTeX 新手指南
[清华大学 thuthesis 提供的新手指南](https://github.com/tuna/thuthesis/wiki/%E6%96%B0%E6%89%8B%E6%8C%87%E5%8D%97)（对本项目同样适用）

### 编译方式
提供了两种编译方式（如下图所示）：
- **Recipe: xelatex + bibtex + xelatex x 2**：包含 BibTeX，想要正确编译参考文献时必须使用此种方式，但是编译速度很慢
- **Recipe: xelatex (fast)**：快速编译，在不修改参考文献时使用
- 推荐平常使用第二种方式即可，只在添加参考文献时使用第一种方式

![[编译方式]](figures/example.png)

### 论文格式设置
在 `main.tex` 文件中，通过 `\documentclass` 的选项来设置论文格式：

```latex
\documentclass[degree=master, academic=true, blindreview=false, colorcover=true]{nwputhesis}
```

各选项说明：
- `degree=bachelor|master|phd`：设置学位，`bachelor` 为本科，`master` 为硕士，`phd` 为博士

硕博特有选项：
- `academic=true|false`：设置学位类型，`true` 为学术型学位，`false` 为专业型学位
- `blindreview=true|false`：设置是否盲评，`true` 为盲评版本（自动隐藏学号、作者、导师信息），`false` 为正常版本
- `colorcover=true|false`：设置是否使用彩色封面和封底，`true` 为彩色（论文最终版提交电子版需要），`false` 为普通版本（用于打印）

### 文件修改说明
用户基本只需要修改 `data` 目录和 `ref` 下的文件：
- `data/abstract.tex`：中英文摘要
- `data/chapter*.tex`：各章节内容
- `data/appendix.tex`：附录
- `data/acknowledgements.tex`：致谢
- `ref/reference.bib`：参考文献

#### 研究生论文（硕士/博士）
- `data/graduate-info.tex`：个人信息
- `data/graduate-committee.tex`：答辩委员会
- `data/graduate-accomplishments.tex`：参加科研情况

#### 本科毕业设计论文
- `data/ungraduate-info.tex`：个人信息
- `data/ungraduate-designsummary.tex`：毕业设计小结

论文插图全部放在 `figures` 目录下，项目已将默认图片路径设为该目录，在 tex 文件中可直接引用文件名，无需添加路径前缀。例如：`\includegraphics{example.png}`。

如需新增章节，请在 `main.tex` 中添加新的 `\input{data/chapterX}` 命令。

## 格式说明

### 字体说明（Windows 用户无需关注）
最终版论文建议以 Windows 字体呈现。本模板会自动检测系统中是否安装有 Windows 字体并自动使用，如果未检测到则自动回退到替代字体。建议用户自行安装 [Windows 字体](https://github.com/dolbydu/font/tree/master/unicode)（或者把最终版论文在 Windows 电脑上编译一下）。

### 参考文献格式
参考文献采用 GB/T 7714 标准，使用常见的悬挂缩进格式（而非首行缩进），可以正常通过学校格式审查。

## 推荐项目

[awesome-ai-research-writing](https://github.com/Leey21/awesome-ai-research-writing)

## 许可证

本项目的硕博格式基于 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 修改，本科生论文格式设计部分参考了 [LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 、 [LaTeX-NewTemplate-For-NPU-undergraduate-Thesis](https://github.com/jialinlvcn/LaTeX-NewTemplate-For-NPU-undergraduate-Thesis) 和 [NWPU-Thesis-Template](https://github.com/lihanshu/NWPU-Thesis-Template) ，项目整体实现设计还参考了 [thuthesis](https://github.com/tuna/thuthesis) 。

本项目采用 [GNU General Public License v3.0](LICENSE) 许可证发布。

Copyright (c) 2016-2022 NWPU Metaphysics Office https://github.com/NWPUMetaphysicsOffice

Modified (c) 2026 by Jiayi Yan https://github.com/1195343015