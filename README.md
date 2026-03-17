# NwpuThesis
本模板已成功通过学校的论文最终版提交（26届），是目前已知所有西北工业大学硕博学位论文 LaTeX 模板中最新最完善的。

本模板格式符合 2025 年西北工业大学研究生院编写的 [西北工业大学研究生学位论文写作指南](https://gs.nwpu.edu.cn/info/2283/30467.htm)。

## 使用说明
- 本项目推荐在 TeX Live 环境下使用，支持各种操作系统。
- 推荐搭配 VS Code 中的 LaTeX Workshop 插件使用

### 字体说明（Windows 用户无需关注）
最终版论文建议以 Windows 字体呈现。本模板会自动检测系统中是否安装有 Windows 字体并自动使用，如果未检测到则自动回退到替代字体。建议用户自行安装 Windows 字体（或者把最终版论文在 Windows 电脑上编译一下）。

### 设置论文格式
在 `nwputhesis-sample.tex` 文件中，通过 `\documentclass` 的选项来设置论文格式：

```latex
\documentclass[degree=master, academic=true, blindreview=false, colorcover=true]{nwputhesis}
```

各选项说明：
- `degree=master|phd`：设置学位，`master` 为硕士，`phd` 为博士
- `academic=true|false`：设置学位类型，`true` 为学术型学位，`false` 为专业型学位
- `blindreview=true|false`：设置是否盲评，`true` 为盲评版本（隐藏个人信息），`false` 为正常版本
- `colorcover=true|false`：设置是否使用彩色封面和封底，`true` 为彩色（论文最终版提交电子版需要），`false` 为普通版本（用于打印）

### 文件修改说明
用户基本只需要修改 `data` 目录和 `ref` 下的文件：
- `data/info.tex`：个人信息
- `data/committee.tex`：答辩委员会
- `data/abstract.tex`：中英文摘要
- `data/chapter*.tex`：各章节内容
- `data/appendix.tex`：附录
- `data/acknowledgements.tex`：致谢
- `data/accomplishments.tex`：参加科研情况
- `ref/reference.bib`：参考文献

论文插图全部放在 `figures` 目录下，项目已将默认图片路径设为该目录，在 tex 文件中可直接引用文件名，无需添加路径前缀。例如：`\includegraphics{example.png}`。

如需新增章节，请在 `nwputhesis-sample.tex` 中添加新的 `\input{data/chapterX}` 命令。

### 编译方式
提供了两种编译方式（如下图所示）：
- **Recipe: xelatex + bibtex + xelatex x 2**：包含 BibTeX，想要正确编译参考文献时必须使用此种方式，但是编译速度很慢
- **Recipe: xelatex (fast)**：快速编译，在不修改参考文献时使用
- 推荐平常使用第二种方式即可，只在添加参考文献时使用第一种方式

![[编译方式]](figures/example.png)

## 先前项目中存在的格式问题（在本项目中均已修正）

| 问题位置 | 具体问题                     | 错误格式（原仓库） | 正确格式（本仓库）     |
| :------- | :--------------------------- | :----------------- | :--------------------- |
| 中文内封 | 作者姓名和指导教师姓名       | 不等宽             | 等宽                   |
| 英文内封 | 作者姓名、指导教师姓名、标题 | 加粗               | 不加粗                 |
| 英文内封 | 月份和年份格式               | 空格隔开           | 使用 “/” 隔开          |
| 英文内封 | 标题字号                     | 二号               | 三号                   |
| 英文内封 | 学位段落的字号               | 三号               | 小三                   |
| 中文摘要 | “关键词：”格式               | 宋体，加粗，不缩进 | 黑体，不加粗，首行缩进 |
| 英文摘要 | 关键词的英文写法             | Key Words          | Key words              |
| 页脚     | 字号                         | 五号               | 小五                   |

注：除了表中列中内容以外，还对部分其它格式细节进行了调整和优化。

## 其他改进
- 新增彩色封面和封底（论文最终版提交需要使用）。
- 将封皮右上角的内容从 cls 文件中迁移到 tex 文件当中，便于用户修改。
- 优化封皮中的指导教师格式，直接将其固定于 cls 模板当中，避免格式出错。
- 优化申请日期格式，直接将其固定于 cls 模板当中，避免格式出错。
- 优化封皮和内封排版，使之更贴近格式要求中的形式。
- 简化 tex 模板，使之更易于上手。
- 修改项目结构，删除不必要的文件。
- 去除了代码中的一些 warnings。
- 更好的跨平台字体支持，自动检测系统字体并选择合适的字体方案。
- 新增 GitHub Actions CI，支持多平台（Ubuntu/macOS/Windows）自动构建和测试。 

## 许可证

本项目基于 [Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis) 修改，部分设计参考了 [thuthesis](https://github.com/tuna/thuthesis)，采用 [GNU General Public License v3.0](LICENSE) 许可证发布。

Copyright (c) 2016-2022 NWPU Metaphysics Office https://github.com/NWPUMetaphysicsOffice

Modified (c) 2026 by Jiayi Yan