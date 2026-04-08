testfiledir = "testfiles/07-bibliography"

includetests = {"*"}
excludetests = {}

supportdir = "testfiles/support"
checksuppfiles = {"*.tex", "*.bib", "*.cls", "figures/*", "*.ttf"}

checkruns = 3
bibtexopts = ""

function runtest_tasks(name, run)
  if (name == "07-bibliography-bachelor"
      or name == "07-bibliography-graduate"
      or name == "07-bibliography-graduate-2025") and run == 1 then
    return bibtexexe .. " " .. name
  end
  return ""
end
