SET FILENAME=%1

compile-thesis-windows-clear.bat

pdflatex -shell-escape -draftmode -synctex=1 -interaction=nonstopmode -extra-mem-top=50000000  -extra-mem-bot=10000000  -main-memory=90000000 "%FILENAME%.tex"
makeindex "%FILENAME%.aux"
makeindex "%FILENAME%.idx"
biber "%FILENAME%"
makeglossaries "%FILENAME%"
pdflatex -shell-escape -draftmode -synctex=1 -interaction=nonstopmode -interaction=nonstopmode -extra-mem-top=50000000  -extra-mem-bot=10000000  -main-memory=90000000  "%FILENAME%.tex"
makeglossaries "%FILENAME%"
pdflatex  -shell-escape -synctex=1 -interaction=nonstopmode -interaction=nonstopmode -extra-mem-top=50000000  -extra-mem-bot=10000000  -main-memory=90000000 "%FILENAME%.tex"

countErrWrnBBx.bat "%FILENAME%.log"

