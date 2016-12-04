@echo >nul

@echo. 2>states.txt

@echo *Services*
@REM @for /F "tokens=*" %%A in (services.txt) do @for /F "tokens=3 delims=: " %%H in ('sc query %%A ^| findstr "        STATE"') do @echo %%H >> states.txt
@for /F "tokens=*" %%A in (services.txt) do @net stop "%%A" >nul 2>nul & echo DISABLING %%A

@echo.
@echo *Processes*
@for /F "tokens=*" %%A in (processes.txt) do @taskkill /F /IM %%A.exe >nul 2>nul & echo TERMINATING %%A

@echo.
@echo You're good to game. GLHF.
@echo.
@echo Press any key when you're done to restore processes.
@pause >nul

REM @for /F "tokens=*" %%A in (services.txt) do @net start "%%A" >nul 2>nul & echo ENABLING %%A
REM @for /F "tokens=*" %%A in (processes.txt) do @taskkill /F /IM %%A.exe >nul 2>nul & echo ENABLING %%A