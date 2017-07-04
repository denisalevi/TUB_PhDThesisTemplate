SET FILENAME = %1
SET OUTPUT = %2
rem MIKTEX_BIN=C:\miktex\texmfs\install\miktex\bin\
rem set PATH=%MIKTEX_BIN%;%PATH%

DEL /Y  "%FILENAME%.aux"
DEL  /Y "%FILENAME%.bbl"
DEL /Y "%FILENAME%.blg"
DEL /Y "%FILENAME%.d"
DEL /Y "%FILENAME%.fls"
DEL /Y "%FILENAME%.ild"
DEL /Y "%FILENAME%.ind"
DEL /Y "%FILENAME%.toc"
DEL /Y "%FILENAME%.lot"
DEL /Y "%FILENAME%.lof"
DEL /Y "%FILENAME%.idx"
DEL /Y "%FILENAME%.out"
DEL /Y "%FILENAME%.nlo"
DEL /Y "%FILENAME%.nls"
DEL /Y "%FILENAME%.pdf"
DEL /Y "%FILENAME%.ps"
DEL /Y "%FILENAME%.dvi"
DEL /Y "%FILENAME%.bcf"
DEL /Y "%FILENAME%.aux.bbl"
DEL /Y "%FILENAME%.aux.blg"



DEL /Y "%FILENAME%.aux"
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
DEL "%FILENAME%.bcf"
DEL "%FILENAME%.aux.bbl"
DEL "%FILENAME%.aux.blg"

lualatex --shell-escape  --draftmode --synctex=1 --interaction=nonstopmode  "%FILENAME%.tex"
bibtex "%FILENAME%.aux"
makeindex "%FILENAME%.aux"
makeindex "%FILENAME%.idx"
makeglossaries "%FILENAME%"
lualatex --shell-escape --draftmode --synctex=1  --interaction=nonstopmode  "%FILENAME%.tex"
makeglossaries "%FILENAME%"
lualatex --shell-escape  --synctex=1  --interaction=nonstopmode "%FILENAME%.tex"
MOVE /Y "%FILENAME%.pdf" "%OUTPUT%.pdf"
countErrWrnBBx.bat "%FILENAME%.log"





