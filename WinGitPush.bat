@echo off
git add .
git commit -m update
git push -f
echo.
echo.
echo.
echo PUSH FINISHED
timeout /t 2
exit