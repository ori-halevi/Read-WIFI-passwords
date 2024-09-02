:: Written by Ori Halevi
@echo off
setlocal enabledelayedexpansion

set rendom_number=!RANDOM!
set "TEMPFILE1=!TEMP!\!rendom_number!1.txt"
set "TEMPFILE2=!TEMP!\!rendom_number!2.txt"

echo.
powershell write-host -fore Cyan ". . . list of wireless networks and their passwords that have ever been connected to this computer:"   
powershell write-host -fore red "--------------------------------"
for /f "skip=8 tokens=2 delims=:" %%T in ( 'NETSH WLAN SHOW PROFILE' ) do (
	set "network_name=%%T"
	set "network_name=!network_name:~1!"
	
	set "org_network_name=!network_name!"
	set "org_network_name=!org_network_name:"=*!"
	
	set "network_name=!network_name:'=''!"
	set "network_name=!network_name:"="""!"
	
	powershell write-host -fore blue "--- Wireless network name:-----> . . . . '!network_name!'"
	
    :: שלב 1: קבל את פרטי הרשת כולל הסיסמה
	for /f "tokens=*" %%A in ('"NETSH WLAN SHOW PROFILE \"!org_network_name!\" KEY=CLEAR"') do (
        set "line=%%A"
        :: שלב 2: מצא את השורה שמכילה את הסיסמה
        echo !line! | findstr /R "Key Content" >nul && (
            for /f "tokens=2 delims=:" %%B in ("!line!") do (
                set "password=%%B"
                set "password=!password:~1!"
                powershell write-host -fore yellow "--- Password:------------------> . . . . '!password!'"
            )
        )
    )
	echo.
)
endlocal

powershell write-host -fore red "--------------------------------"
echo.
echo Press any key to exit...
pause >Nul
EXIT /b