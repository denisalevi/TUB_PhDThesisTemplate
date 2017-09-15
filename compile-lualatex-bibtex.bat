SET FILENAME=thesis
rem MIKTEX_BIN=C:\miktex\texmfs\install\miktex\bin\
rem set PATH=%MIKTEX_BIN%;%PATH%

DEL "%FILENAME%.aux"
DEL "%FILENAME%.bbl"
DEL "%FILENAME%.blg"
DEL "%FILENAME%.d"
DEL "%FILENAME%.fls"
DEL "%FILENAME%.ild"
DEL "%FILENAME%.ind"
DEL "%FILENAME%.toc"
DEL "%FILENAME%.lot"
DEL "%FILENAME%.lof"
DEL "%FILENAME%.idx"
DEL "%FILENAME%.out"
DEL "%FILENAME%.nlo"
DEL "%FILENAME%.nls"
DEL "%FILENAME%.pdf"
DEL "%FILENAME%.ps"
DEL "%FILENAME%.dvi"

DEL "%FILENAME%.aux"
DEL "%FILENAME%.acn"
DEL "%FILENAME%.acr"
DEL "%FILENAME%.alg"
DEL "%FILENAME%.auxlock"
DEL "%FILENAME%.bbl"
DEL "%FILENAME%.blg"
DEL "%FILENAME%.d"
DEL "%FILENAME%.fls"
DEL "%FILENAME%.ild"
DEL "%FILENAME%.ilg"
DEL "%FILENAME%.ind"
DEL "%FILENAME%.ist"
DEL "%FILENAME%.toc"
DEL "%FILENAME%.lot"
DEL "%FILENAME%.lof"
DEL "%FILENAME%.idx"
DEL "%FILENAME%.out"
DEL "%FILENAME%.pre"
DEL "%FILENAME%.nlo"
DEL "%FILENAME%.nls"
DEL "%FILENAME%.slg"
DEL "%FILENAME%.syg"
DEL "%FILENAME%.syi"


lualatex --shell-escape  --draftmode --synctex=1 --interaction=nonstopmode  "%FILENAME%.tex"
makeindex -s "%FILENAME%.ist" -o "%FILENAME%.gls" "%FILENAME%.glo"
bibtex "%FILENAME%.aux"
rem biber "%FILENAME%"
rem makeindex "%FILENAME%.aux"
rem makeindex "%FILENAME%.idx"
makeglossaries "%FILENAME%"
lualatex --shell-escape --draftmode --synctex=1  --interaction=nonstopmode  "%FILENAME%.tex"
rem makeglossaries "%FILENAME%"
lualatex --shell-escape  --synctex=1  --interaction=nonstopmode "%FILENAME%.tex"

countErrWrnBBx.bat "%FILENAME%.log"




