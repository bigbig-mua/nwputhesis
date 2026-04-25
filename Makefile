# Makefile for NWPUThesis
# 参考 thuthesis 的 Makefile 结构

PACKAGE = nwputhesis
SAMPLE  = master
TEST_COMMITTEE = 03-committee-graduate
TEST_ACCOMPLISHMENTS = 06-accomplishments-graduate
TEST_ACK = 05-acknowledgements-bachelor 05-acknowledgements-graduate
TEST_ABSTRACT = 02-abstract-bachelor 02-abstract-graduate
TEST_TITLE_PAGE = 01-title-page-bachelor 01-title-page-master-academic 01-title-page-master-professional 01-title-page-phd
TEST_TOC = 04-toc-bachelor 04-toc-graduate
TEST_BIBER = 07-bibliography-bachelor 07-bibliography-graduate
TEST_DESIGNSUMMARY = 08-designsummary-bachelor
TEST_APPENDIX = 09-appendix-bachelor 09-appendix-graduate-multiple 09-appendix-graduate-single

LATEXMK = latexmk
L3BUILD = l3build
SHELL   := /usr/bin/env bash

# 跨平台删除命令
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all doc thesis clean cleanall distclean view viewthesis test wordcount

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
	$(LATEXMK) -C $(SAMPLE)
	-@$(RM) -f *.gls *.glo *.ind *.idx *.ilg *.nlo *.nls 2>/dev/null || true

# 清理所有生成文件
cleanall: clean
	-@$(RM) -f $(SAMPLE).pdf $(PACKAGE).pdf 2>/dev/null || true

# 字数统计
wordcount: thesis
	texcount -inc -chinese -utf8 $(SAMPLE).tex

# 测试目标（用于 CI，使用 l3build）
test:
ifeq ($(target),)
	@bash -c '\
		EXIT_CODE=0; \
		echo "Running all test groups..."; \
		$(L3BUILD) check --config testfiles/config-committee $(TEST_COMMITTEE) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-accomplishments $(TEST_ACCOMPLISHMENTS) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-acknowledgements $(TEST_ACK) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-abstract $(TEST_ABSTRACT) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-title-page $(TEST_TITLE_PAGE) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-toc $(TEST_TOC) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-biber $(TEST_BIBER) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-designsummary $(TEST_DESIGNSUMMARY) || EXIT_CODE=1; \
		$(L3BUILD) check --config testfiles/config-appendix $(TEST_APPENDIX) || EXIT_CODE=1; \
		echo ""; \
		if [ $$EXIT_CODE -ne 0 ]; then \
			echo "TEST SUMMARY: at least one test group failed."; \
			exit $$EXIT_CODE; \
		fi; \
		echo "TEST SUMMARY: all test groups passed."; \
		exit 0; \
	'
else
	bash testfiles/test.sh $(target)
endif
