# Makefile for NWPUThesis
# 参考 thuthesis 的 Makefile 结构

PACKAGE = nwputhesis
SAMPLE  = main

LATEXMK = latexmk
SHELL   := /usr/bin/env bash

# 跨平台删除命令
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all doc thesis clean cleanall distclean view viewthesis test

# 默认目标：构建示例论文
all: thesis

# 构建示例论文
thesis: $(SAMPLE).pdf

$(SAMPLE).pdf:
	$(LATEXMK) -xelatex $(SAMPLE)

# 构建文档（如果有 dtx 文件）
doc: $(PACKAGE).pdf

# 查看生成的 PDF
view: viewthesis

viewthesis: thesis
	$(LATEXMK) -pv $(SAMPLE)

# 清理辅助文件
clean:
	$(LATEXMK) -c $(SAMPLE)
	-@$(RM) -f *.gls *.glo *.ind *.idx *.ilg *.nlo *.nls 2>/dev/null || true

# 清理所有生成文件
cleanall: clean
	-@$(RM) -f $(SAMPLE).pdf $(PACKAGE).pdf 2>/dev/null || true

# 测试目标（用于 CI，使用 l3build）
test:
ifeq ($(target),)
	l3build check
else
	bash testfiles/test.sh $(target)
endif