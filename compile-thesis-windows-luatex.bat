SET FILENAME = %1
SET OUTPUT = %2
rem MIKTEX_BIN=C:\miktex\texmfs\install\miktex\bin\
rem set PATH=%MIKTEX_BIN%;%PATH%

compile-thesis-windows-clear.bat

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





