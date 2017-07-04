SETLOCAL EnableExtensions EnableDelayedExpansion

SET arg[0]=%1
SET arg[1]=%2

if "!arg[0]!"=="" ( set FILENAME=thesis)else ( set FILENAME=!arg[0]!)
if "!arg[1]!"=="" ( set OUTPUT=thesis_luatex)else ( set OUTPUT=!arg[1]!)
rem MIKTEX_BIN=C:\miktex\texmfs\install\miktex\bin\
rem set PATH=%MIKTEX_BIN%;%PATH%

DEL   "%FILENAME%.aux"
DEL   "%FILENAME%.bbl"
DEL  "%FILENAME%.blg"
DEL  "%FILENAME%.d"
DEL  "%FILENAME%.fls"
DEL  "%FILENAME%.ild"
DEL  "%FILENAME%.ind"
DEL  "%FILENAME%.toc"
DEL  "%FILENAME%.lot"
DEL  "%FILENAME%.lof"
DEL  "%FILENAME%.idx"
DEL  "%FILENAME%.out"
DEL  "%FILENAME%.nlo"
DEL  "%FILENAME%.nls"
DEL  "%FILENAME%.pdf"
DEL  "%FILENAME%.ps"
DEL  "%FILENAME%.dvi"
DEL  "%FILENAME%.bcf"
DEL  "%FILENAME%.aux.bbl"
DEL  "%FILENAME%.aux.blg"



DEL  "%FILENAME%.aux"
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
biber "%FILENAME%"
makeindex "%FILENAME%.aux"
makeindex "%FILENAME%.idx"
makeglossaries "%FILENAME%"
lualatex --shell-escape --draftmode --synctex=1  --interaction=nonstopmode  "%FILENAME%.tex"
makeglossaries "%FILENAME%"
lualatex --shell-escape  --synctex=1  --interaction=nonstopmode "%FILENAME%.tex"
MOVE /Y %FILENAME%.pdf %OUTPUT%.pdf
countErrWrnBBx.bat "%FILENAME%.log"





