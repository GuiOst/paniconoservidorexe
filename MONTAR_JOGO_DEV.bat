@echo off
chcp 65001 >nul
echo A partir da versao 0.12.0 os .exe sao montados pelo PUBLICAR_JOGO.bat
echo (na pasta principal do projeto). Abrindo ele agora...
echo (O script antigo da 0.11.0 esta em build\versoes_anteriores\0.11.0.)
pause
call "%~dp0..\..\PUBLICAR_JOGO.bat"
