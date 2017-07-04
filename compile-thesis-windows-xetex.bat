SET FILENAME=%1
SET OUTPUT = %2
rem MIKTEX_BIN=C:\miktex\texmfs\install\miktex\bin\
rem set PATH=%MIKTEX_BIN%;%PATH%

compile-thesis-windows-clear.bat

xelatex -shell-escape   -synctex=1 -interaction=nonstopmode -extra-mem-top=50000000  -extra-mem-bot=10000000  -main-memory=90000000   "%FILENAME%.tex"
bibtex "%FILENAME%.aux"
makeindex "%FILENAME%.aux"
makeindex "%FILENAME%.idx"
makeglossaries "%FILENAME%"
xelatex -shell-escape  -synctex=1  -interaction=nonstopmode  -extra-mem-top=50000000  -extra-mem-bot=10000000  -main-memory=90000000 "%FILENAME%.tex"
MOVE /Y "%FILENAME%.pdf" "%OUTPUT%.pdf"
countErrWrnBBx.bat "%FILENAME%.log"



