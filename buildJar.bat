SET SEVEN_ZIP="C:\Program Files\7-Zip\7z.exe"

del /f/q/s android\AdMob\build\res

del /f/q/s android\AdMob\build\temp

mkdir android\AdMob\build\temp

mkdir android\AdMob\app\build\outputs\aar\temp

%SEVEN_ZIP% x android\AdMob\app\build\outputs\aar\*.aar -oandroid\AdMob\app\build\outputs\aar\temp -y

copy android\AdMob\app\build\outputs\aar\temp\*.jar android\AdMob\build\temp
copy android\AdMob\app\build\outputs\aar\temp\libs\*.jar android\AdMob\build\temp

del android\AdMob\build\temp\FlashRuntimeExtensions.jar

%SEVEN_ZIP% x android\AdMob\build\temp\*.jar -oandroid\AdMob\build\temp -y

xcopy android\AdMob\app\build\outputs\aar\app-debug\res android\AdMob\build\res\ /e

del android\AdMob\build\temp\*.jar

del android\AdMob\build\*.jar

cd android\AdMob\build\temp

%SEVEN_ZIP% a ..\libAdMob.jar *

cd ..\..\..\..

del /f/q/s android\AdMob\build\temp

rmdir /q/s android\AdMob\build\temp

del /f/q/s android\AdMob\app\build\outputs\aar\temp

rmdir /q/s android\AdMob\app\build\outputs\aar\temp

