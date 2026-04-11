# NwpuThesis

[![Test](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml/badge.svg)](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

> 模板升级时，用户通常不需要改动已填写好的 `data` 、`figures` 和 `ref` 内容，只需要替换其他文件即可，如有特殊情况会在 Releases 页面说明。

本模板已成功通过学校的论文最终版提交（26届硕士），是截至目前（26年4月）已知所有西北工业大学硕博学位论文 LaTeX 模板中最新最完善的，现已添加本科毕业设计论文支持。（本模板并非学校官方提供模板）

本模板格式符合 2025 年西北工业大学研究生院编写的 [西北工业大学研究生学位论文写作指南](https://gs.nwpu.edu.cn/info/2283/30467.htm) ，修复了先前 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 中的多处格式问题。

本科论文格式符合 26 届最新要求，参考 [西北工业大学本科毕业设计（论文）撰写规范](https://jiaowu.nwpu.edu.cn/info/1160/24598.htm)。

> 如果没有强烈使用 LaTeX 写论文的需求，推荐使用 Typst 模板 **[modern-npu-thesis](https://github.com/1195343015/modern-npu-thesis)** ，这是一个 **西北工业大学本硕博论文 Typst 模板**。相比 LaTeX，其语法更简洁，类似于 Markdown 语法，对新手更友好，编译速度远比 LaTeX 快。

## 使用说明
- 推荐直接下载 [最新 Release 版本](https://github.com/1195343015/nwputhesis/releases/latest) 使用，非 Windows 系统用户需要从仓库中自行下载 Windows 字体。（不推荐 clone/fork 使用，因为仓库里有很多用于测试的文件，整体体积较大，而且处于不稳定的开发状态）
- 支持各种操作系统，推荐在 TeX Live 最新版本下搭配 VS Code 中的 LaTeX Workshop 插件使用。

### 编译方式
提供了两种编译方式（如下图所示）：
- **Recipe: xelatex + biber + xelatex x 2**：想要正确编译参考文献时必须使用此种方式，但是编译速度较慢
- **Recipe: xelatex (fast)**：快速编译，在不修改参考文献时使用
- 推荐平常使用第二种方式即可，只在添加参考文献时使用第一种方式

![[编译方式]](figures/example.png)

### 论文格式设置
在 `main.tex` 文件中，通过 `\documentclass` 的选项来设置论文格式：

```latex
\documentclass[degree=master, localfonts=false, academic=false, blindreview=false, colorcover=false]{nwputhesis}
```

各选项说明：
- `degree=bachelor|master|phd`：设置学位，`bachelor` 为本科，`master` 为硕士，`phd` 为博士
- `localfonts=true|false`：是否使用本地 `fonts` 目录字体，`true` 为使用本地字体（适用于无 Windows 字体的系统），`false` 为自动检测系统字体

硕博特有选项：
- `academic=true|false`：设置学位类型，`true` 为学术型学位，`false` 为专业型学位
- `blindreview=true|false`：设置是否盲评，`true` 为盲评版本（自动隐藏学号、作者、导师信息），`false` 为正常版本
- `colorcover=true|false`：设置是否使用彩色封面和封底，`true` 为彩色（论文最终版提交电子版需要），`false` 为普通版本（用于打印）

### 文件修改说明
用户基本只需要修改 `data` 和 `ref` 下的文件：
- `ref/reference.bib`：参考文献

#### 研究生论文（硕士/博士）
- `data/graduate/`：研究生论文相关内容，包括个人信息、摘要、正文各章节、附录、致谢、答辩委员会和科研情况等

#### 本科毕业设计论文
- `data/undergraduate/`：本科毕业设计论文相关内容，包括个人信息、摘要、正文各章节、附录、致谢和毕业设计小结等

论文插图全部放在 `figures` 目录下，项目已将默认图片路径设为该目录，在 tex 文件中可直接引用文件名，无需添加路径前缀。例如：`\includegraphics{example.png}`。

`main.tex` 中的 `\listoffigures` 和 `\listoftables` 是硕博论文的可选项。学校模板未强制要求图目录和表目录，如果不需要，直接将这两行注释掉即可,附录等其他内容同理。

如需新增或删除章节，请在 `main.tex` 中对应学位类型的目录分支下添加或删除 `\input{data/graduate/chapterX}` 或 `\input{data/undergraduate/chapterX}` 命令。

硕博提交最终版论文时，可直接将签字版声明扫描成电子版 PDF，替换 [声明.pdf](figures/声明.pdf)。

### LaTeX 新手指南
[清华大学 thuthesis 提供的新手指南](https://github.com/tuna/thuthesis/wiki/%E6%96%B0%E6%89%8B%E6%8C%87%E5%8D%97)（对本项目同样适用）

## 推荐项目
[awesome-ai-research-writing](https://github.com/Leey21/awesome-ai-research-writing)
[AI-Research-SKILLs](https://github.com/Orchestra-Research/AI-Research-SKILLs)

## 许可证
本项目的硕博格式基于 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 修改，本科生论文格式设计部分参考了 [LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 、 [LaTeX-NewTemplate-For-NPU-undergraduate-Thesis](https://github.com/jialinlvcn/LaTeX-NewTemplate-For-NPU-undergraduate-Thesis) 和 [NWPU-Thesis-Template](https://github.com/lihanshu/NWPU-Thesis-Template) ，项目整体实现设计还参考了 [thuthesis](https://github.com/tuna/thuthesis) 。

本项目采用 [GNU General Public License v3.0](LICENSE) 许可证发布。

Copyright (c) 2016-2022 NWPU Metaphysics Office https://github.com/NWPUMetaphysicsOffice

Modified (c) 2026 by Jiayi Yan https://github.com/1195343015
