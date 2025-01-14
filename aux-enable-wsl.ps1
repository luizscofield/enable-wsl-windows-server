# Script Owner: Luiz Scofield
# Creation Date: 04/01/2024

echo "Starting execution."
Start-Sleep -Seconds 2
echo "-----------------------------------------------------------------------------------"

# Enabling Windows Subsystem for Linux (WSL)
echo "Enabling feature: Windows Subsystem for Linux (WSL)"
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
echo ""
echo "-----------------------------------------------------------------------------------"

# Enabling Virtual Machine Platform
echo "Enabling feature: Virtual Machine Platform"
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
echo ""
echo "-----------------------------------------------------------------------------------"

#Restarting the computer
echo "You need to reboot Windows before executing the next script."
echo "Please choose Yes [Y] to continue with the reboot."
echo ""
Start-Sleep -Seconds 2
Restart-Computer -Confirm:$true