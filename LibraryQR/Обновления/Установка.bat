@echo off
setlocal

rem Указываем путь к программе 7-Zip
set "SEVEN_ZIP=7-Zip\7z.exe"

rem Указываем путь к zip-архиву
set "ZIP_FILE=LibraryQR_v.8.zip"

rem Указываем путь к папке, куда нужно распаковать архив
set "DESTINATION_FOLDER=..\..\LibraryQR"

rem Создаем временную папку для распаковки
set "TEMP_FOLDER=%TEMP%\LibraryQR"

rem Создаем папку, если она еще не существует
if not exist "%DESTINATION_FOLDER%" mkdir "%DESTINATION_FOLDER%"

rem Распаковываем архив
"%SEVEN_ZIP%" x "%ZIP_FILE%" -o"%TEMP_FOLDER%"

rem Копируем файлы из временной папки в папку Debug
xcopy /s /e /y "%TEMP_FOLDER%\*" "%DESTINATION_FOLDER%"

rem Удаляем временную папку
rd /s /q "%TEMP_FOLDER%"

echo "Install Complete ✅✔	."

pause >nul

endlocal
