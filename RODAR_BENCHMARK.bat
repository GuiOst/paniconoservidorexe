@echo off
chcp 65001 >nul
REM Teste de desempenho do Pânico no Servidor (0.13.0).
REM Abre o jogo, passa por casa do Davi, rua, casa do Caio, portaria, estrada,
REM fábrica, subsolo e laboratório, mede FPS/CPU/GPU e fecha sozinho.
REM O resultado fica na pasta "benchmark_resultados" ao lado deste arquivo
REM (e também em %APPDATA%\Godot\app_userdata\Pânico no Servidor\benchmark\).
REM
REM   RODAR_BENCHMARK.bat          -> qualidade salva no jogo
REM   RODAR_BENCHMARK.bat all      -> Baixo, Médio, Alto e Ultra seguidos
REM   RODAR_BENCHMARK.bat medium   -> uma qualidade (low | medium | high | ultra)

set "EXE="
for %%F in ("%~dp0PanicoNoServidor.exe" "%~dp0PanicoNoServidor_DEV.exe" "%~dp0build\windows\PanicoNoServidor.exe" "%~dp0build\windows_dev\PanicoNoServidor_DEV.exe") do (
  if not defined EXE if exist "%%~F" set "EXE=%%~F"
)
if not defined EXE (
  echo Nao encontrei o PanicoNoServidor.exe. Rode antes o PUBLICAR_JOGO.bat.
  pause
  exit /b 1
)
set "QUAL="
if not "%~1"=="" set "QUAL=--bench-quality=%~1"
echo Usando: %EXE%
echo Rodando o teste de desempenho. Nao mexa no mouse ate o jogo fechar (uns 3 minutos por qualidade).
"%EXE%" -- --benchmark %QUAL% "--bench-out=%~dp0benchmark_resultados"
echo.
echo Pronto. Abrindo a pasta com o resultado...
start "" "%~dp0benchmark_resultados"
