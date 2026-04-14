#!/usr/bin/env texlua
-- build.lua for nwputhesis
-- l3build testing framework configuration

module = "nwputhesis"

supportdir = "./testfiles/support"
checksuppfiles = {"*.tex", "*.bib", "*.cls", "figures/*", "*.ttf"}

installfiles = {"*.cls"}
sourcefiles = {"*.cls"}

checkengines = {"xetex"}
stdengine = "xetex"
specialformats = specialformats or {}
specialformats.latex = specialformats.latex or {}
specialformats.latex.xetex = {
  binary = "xelatex",
  format = "",
  options = "-no-pdf",
}

-- 标题页测试在子目录中，需要单独配置
checkconfigs = {
  "build",
  "testfiles/config-committee",
  "testfiles/config-accomplishments",
  "testfiles/config-acknowledgements",
  "testfiles/config-abstract",
  "testfiles/config-title-page",
  "testfiles/config-toc",
  "testfiles/config-biber",
  "testfiles/config-designsummary",
}

-- 排除标题页测试（它们在子目录中单独运行）
excludetests = {"01-*", "02-*", "03-*", "04-*", "05-*", "06-*", "07-*", "08-*"}

typesetexe = "xelatex"
unpackexe = "xetex"
bibtexexe = "biber"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode"

lvtext = ".tex"
maxprintline = 79

local is_windows = package.config:sub(1, 1) == "\\"
if is_windows then
  function runcmd(cmd, dir, vars)
    dir = dir or "."
    vars = vars or {}
    local env
    if checkformat ~= "context" then
      env = os_setenv .. " TEXMFCNF=." .. os_pathsep
    end
    local envpaths = "." .. localtexmf() .. os_pathsep
      .. localdir .. os_pathsep
      .. dir .. (typesetsearch and os_pathsep or "")
    if string.match(envpaths, " ") then
      envpaths = string.gsub(envpaths, '"', "")
    end
    for _, var in pairs(vars) do
      env = (env and (env .. os_concat) or "")
        .. os_setenv .. " " .. var .. "=" .. envpaths
    end
    cmd = string.gsub(cmd, '"%s*\\\\input%s+([^"]+)"', '\\input %1')
    return run(
      dir,
      set_epoch_cmd(epoch, forcedocepoch)
        .. (env and (env .. os_concat) or "")
        .. cmd
    )
  end
end
