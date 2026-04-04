testfiledir = "testfiles"

includetests = {"07-bibliography"}
excludetests = {}

supportdir = "testfiles/support"
checksuppfiles = {"*.tex", "*.bib", "*.cls", "figures/*", "*.ttf"}

checkruns = 3
bibtexopts = ""

function runtest_tasks(name, run)
  if name == "07-bibliography" and run == 1 then
    return bibtexexe .. " " .. name
  end
  return ""
end
