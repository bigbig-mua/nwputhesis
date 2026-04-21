# NwpuThesis

[![Test](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml/badge.svg)](https://github.com/1195343015/nwputhesis/actions/workflows/test.yml)
[![Release](https://img.shields.io/github/v/release/1195343015/nwputhesis)](https://github.com/1195343015/nwputhesis/releases/latest)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

> 如果没有强烈使用 LaTeX 写论文的需求，推荐使用 Typst 模板 **[modern-npu-thesis](https://github.com/1195343015/modern-npu-thesis)** ，这是一个 **西北工业大学本硕博论文 Typst 模板**。相比 LaTeX，其语法更简洁，类似于 Markdown 语法，对新手更友好，编译速度远比 LaTeX 快。

本模板支持本硕博，已成功通过学校的论文最终版提交（26届硕士）。

本模板硕博格式符合 2025 年西北工业大学研究生院编写的 [西北工业大学研究生学位论文写作指南](https://gs.nwpu.edu.cn/info/2283/30467.htm) ，修复了先前 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 中的多处格式问题。

本科论文格式符合 26 届最新要求，参考 [西北工业大学本科毕业设计（论文）撰写规范](https://jiaowu.nwpu.edu.cn/info/1160/24598.htm)。

## 版本更新说明
- 模板升级时，用户通常不需要改动已填写好的 `content` 内容，只需要替换其他文件即可，如有特殊情况会在 Releases 页面说明。
  
- 本模板版本号采用 `X.Y.Z` 形式：
- `X` 表示重大更新，例如跟进学校发布的新模板格式。
- `Y` 表示影响模板使用方式的更新。
- `Z` 表示格式修复或其它不影响模板使用方式的更新。

## 使用说明
- 推荐直接下载 [最新 Release 版本](https://github.com/1195343015/nwputhesis/releases/latest) 使用，非 Windows 系统用户需要从仓库中自行下载 Windows 字体。（不推荐 clone/fork 使用，因为仓库里有很多用于测试的文件，整体体积较大，而且处于不稳定的开发状态）
- 支持各种操作系统，推荐在 TeX Live 最新版本下搭配 VS Code 中的 LaTeX Workshop 插件使用。

### 编译方式
提供了两种编译方式（如下图所示）：
- **Recipe: xelatex + biber + xelatex x 2**：想要正确编译参考文献时必须使用此种方式，但是编译速度较慢
- **Recipe: xelatex (fast)**：快速编译，在不修改参考文献时使用
- 推荐平常使用第二种方式即可，只在添加参考文献时使用第一种方式

![[编译方式]](content/figures/example.png)

### 论文格式设置
推荐直接编译对应的入口文件：
- `bachelor.tex`：本科毕业设计论文
- `master.tex`：硕士学位论文
- `phd.tex`：博士学位论文

论文类型、字体、学术/专业学位、盲评和彩色封面等加载期选项统一写在入口文件的 `\documentclass[...]` 中。例如：

```tex
\documentclass[
    degree = master,
    fontset = auto,
    academic = false,
    blindreview = false,
    colorcover = false,
]{nwputhesis}
```

常用选项说明：

- `degree`：论文类型，可选 `bachelor`、`master`、`phd`。
- `fontset`：字体方案，可选 `auto`、`fandol`、`windows`、`adobe`、`local`。非 Windows 系统如果没有 Windows 字体，建议使用 `auto` 或 `fandol`。
- `academic`：研究生论文是否为学术学位，`true` 为学术学位，`false` 为专业学位。
- `blindreview`：是否生成盲评版本，`true` 会隐藏作者、导师和学号等信息。
- `colorcover`：是否生成彩色封面封底，通常用于最终提交电子版。
- `bibstyle`：参考文献标准，可选 `2015`、`2025`。

题目、作者、学院、专业、导师、日期、学号、基金资助等元数据统一写在 `content/thesis/*/info.tex` 或摘要文件中的 `\nwputhesissetup{...}`。例如：

```tex
\nwputhesissetup{
    title = {论文中文题目},
    title* = {English Thesis Title},
    author = {张三},
    author* = {San Zhang},
    year = {2026},
    month = {3},
    school = {计算机学院},
    major = {计算机科学与技术},
    major* = {Computer Science and Technology},
    advisor = {李四},
    advisor* = {Si Li},
}
```

旧版 `thesis-setup.tex` 配置入口已经移除；请直接修改入口文件的 `\documentclass[...]` 选项。

### 文件修改说明
用户基本只需要修改 `content/` 下的文件：

#### 研究生论文（硕士/博士）
- `content/thesis/graduate/`：研究生论文相关内容，包括个人信息、摘要、正文各章节、附录、致谢、答辩委员会和科研情况等

#### 本科毕业设计论文
- `content/thesis/undergraduate/`：本科毕业设计论文相关内容，包括个人信息、摘要、正文各章节、附录、致谢和毕业设计小结等

论文插图全部放在 `content/figures` 目录下，项目已将默认图片路径设为该目录，在 tex 文件中可直接引用文件名，无需添加路径前缀。例如：`\includegraphics{example.png}`。

硕博提交最终版论文时，可直接将签字版声明扫描成电子版 PDF，替换 [声明.pdf](content/figures/声明.pdf)。

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
