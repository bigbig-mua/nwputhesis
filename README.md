<div align="center">

**西北工业大学本硕博论文 LaTeX 模板**

***NwpuThesis***

[![Test](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml/badge.svg)](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml)
[![TeX Live](https://img.shields.io/badge/TeX%20Live-2026-yellow)](https://www.tug.org/texlive/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

</div>

> 强烈推荐使用 Typst 模板 **[modern-npu-thesis](https://github.com/1195343015/modern-npu-thesis)** 。相比 LaTeX，其语法更简洁，类似于 Markdown 语法，对新手更友好，编译速度远比 LaTeX 快。

本模板支持本硕博，已成功通过学校的论文最终版提交（26届硕士）。

本模板在 TeX Live 2025 和 2026 下均通过 CI 构建测试，可从 [Actions 构建产物](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml) 下载编译好的 PDF。

本模板硕博格式符合 2025 年西北工业大学研究生院编写的 [西北工业大学研究生学位论文写作指南](https://gs.nwpu.edu.cn/info/2283/30467.htm) ，修复了先前 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 中的多处格式问题。

本科论文格式符合 26 届最新要求，参考 [西北工业大学本科毕业设计（论文）撰写规范](https://jiaowu.nwpu.edu.cn/info/1160/24598.htm)。

编译得到的参考文献格式有问题的，可以在命令行执行 `tlmgr update biblatex-gb7714-2015`。

> **近期更新**
> 1. `master.tex` 和 `phd.tex` 已合并为 `graduate.tex`（默认硕士，改 `degree = phd` 即可编译博士）
> 2. 原根目录下的 `thesis-body.tex` 已拆分移至 `content/thesis/undergraduate/thesis-body.tex`（本科）和 `content/thesis/graduate/thesis-body.tex`（研究生）

## 使用说明
推荐通过 Fork / Clone 仓库获取模板，可以获取最新版本，方便后续通过 Git 跟踪更新。

非 Windows 系统用户需要从仓库中自行下载 Windows 字体。

### 编译方式
推荐在 TeX Live 最新版本下搭配 VS Code 中的 LaTeX Workshop 插件使用，提供了两种编译方式（如下图所示）：
- **Recipe: xelatex + biber + xelatex x 2**：想要正确编译参考文献时必须使用此种方式，但是编译速度较慢
- **Recipe: xelatex (fast)**：快速编译，在不修改参考文献时使用
- 推荐平常使用第二种方式即可，只在添加参考文献时使用第一种方式

![[编译方式]](infra/nwputhesis/assets/example.png)

### 论文格式设置
推荐直接编译对应的入口文件：
- `bachelor.tex`：本科毕业设计论文
- `graduate.tex`：硕博学位论文（默认硕士，改 `degree = phd` 即可编译博士）

各入口文件的论文内容分别在 `content/thesis/undergraduate/thesis-body.tex` 和 `content/thesis/graduate/thesis-body.tex` 中组织。

论文类型、字体、学术/专业学位、盲评和彩色封面等加载期选项统一写在入口文件的 `\documentclass[...]` 中。例如：

```tex
\documentclass[
    degree = master,
    fontset = windows,
    academic = false,
    blindreview = false,
    colorcover = false,
    bibindent = auto,
]{nwputhesis}
```

常用选项说明：

- `degree`：论文类型，可选 `bachelor`、`master`、`phd`。
- `fontset`：字体方案，可选 `windows`、`local`。非 Windows 系统建议下载本仓库中的字体后使用 `local` 选项。
- `blindreview`：是否生成盲评版本，`true` 会隐藏作者、导师和学号等信息。
- `bibindent`：参考文献编号缩进模式，可选 `auto`（本科不缩进，研究生首行缩进）、`firstline`（首行缩进）、`none`（不缩进）、`hanging`（悬挂缩进，编号右对齐）。

研究生特有选项：

- `academic`：研究生论文是否为学术学位，`true` 为学术学位，`false` 为专业学位。
- `colorcover`：是否生成彩色封面封底，用于最终提交电子版。

### 文件修改说明
用户基本只需要修改 `content/` 下的文件：

#### 研究生论文（硕士/博士）
- `content/thesis/graduate/`：研究生论文相关内容，包括个人信息、摘要、正文各章节、附录、致谢、答辩委员会和科研情况等

#### 本科毕业设计论文
- `content/thesis/undergraduate/`：本科毕业设计论文相关内容，包括个人信息、摘要、正文各章节、附录、致谢和毕业设计小结等

论文插图全部放在 `content/figures` 目录下，项目已将默认图片路径设为该目录，在 tex 文件中可直接引用文件名，无需添加路径前缀。例如：`\includegraphics{example.png}`。

硕博提交最终版论文时，可直接将签字版声明扫描成电子版 PDF，替换 [研究生学位论文使用授权声明.pdf](content/figures/研究生学位论文使用授权声明.pdf)。

## 推荐项目
[awesome-ai-research-writing](https://github.com/Leey21/awesome-ai-research-writing)

[AI-Research-SKILLs](https://github.com/Orchestra-Research/AI-Research-SKILLs)

## 交流群

<img src="content/figures/QQ交流群.png" width="200">

## 许可证
本项目的硕博格式基于 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 修改，本科生论文格式设计部分参考了 [LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 、 [LaTeX-NewTemplate-For-NPU-undergraduate-Thesis](https://github.com/jialinlvcn/LaTeX-NewTemplate-For-NPU-undergraduate-Thesis) 和 [NWPU-Thesis-Template](https://github.com/lihanshu/NWPU-Thesis-Template) ，项目整体实现设计还参考了 [thuthesis](https://github.com/tuna/thuthesis) 。

本项目采用 [GNU General Public License v3.0](LICENSE) 许可证发布。

Copyright (c) 2016-2022 NWPU Metaphysics Office https://github.com/NWPUMetaphysicsOffice

Modified (c) 2026 by Jiayi Yan https://github.com/1195343015
