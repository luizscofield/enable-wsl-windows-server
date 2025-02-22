# Script Owner: Luiz Scofield
# Creation Date: 04/01/2024

echo "Starting execution."
echo "-----------------------------------------------------------------------------------"
echo ""
echo ""
echo ""
echo ""
echo ""
Start-Sleep -Seconds 2

#Saving work directory as variable
$dir="D:\Scripts\workdir"

#Creating workdir
echo "Step 1. Creating directory to store script data."
mkdir $dir | Out-Null
echo ""
echo "Success! Created directory: $dir"
echo "-----------------------------------------------------------------------------------"

#Downloading Linux Kernel Update
echo "Step 2. Downloading Linux Kernel Update package. Please wait."
curl -o $dir\linux-kernel-update.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
echo ""
echo "Success! Downloaded MSI file."
echo "-----------------------------------------------------------------------------------"

#Executing Linux Kernel Update
echo "Step 3."
echo "Now we should install the Linux Kernel Update package."
echo "Please follow the MSI installation untill it is finished."
echo ""
echo ""
Start-Sleep -Seconds 5
Start-Process msiexec.exe -ArgumentList "/I $dir\linux-kernel-update.msi" -wait
echo "MSI process terminated. Resuming script..."
echo "-----------------------------------------------------------------------------------"

#Downloading Ubuntu 22.04 LTS (Linux Distribution)
echo "Step 4. Downloading Ubuntu."
echo "Please wait while the file is being downloaded."
curl -o $dir\ubuntu-package.appx https://aka.ms/wslubuntu2204
echo ""
echo "Download successful."
echo "-----------------------------------------------------------------------------------"

#Unziping files
echo "Step 5. Unziping files"
mv $dir\ubuntu-package.appx $dir\ubuntu-package.zip
Expand-Archive $dir\ubuntu-package.zip $dir\ubuntu-package
mv $dir\ubuntu-package\Ubuntu_2204.1.7.0_x64.appx $dir\ubuntu-package\ubuntu-2204.zip
Expand-Archive $dir\ubuntu-package\ubuntu-2204.zip C:\Ubuntu -Force
Start-Sleep -Seconds 1
echo ""
echo "Created directory C:\Ubuntu to store runtime files."
echo "-----------------------------------------------------------------------------------"

#Installing Ubuntu
echo "Step 6. Installing Ubuntu."
echo "Another terminal will be opened as administrator to follow the installation."
echo "Once it is installed, the new terminal will be closed and this one will continue the process."
$commands={C:\Ubuntu\ubuntu.exe}
Start-process PowerShell -verb runas -ArgumentList "-NoProfile -Command $commands" -wait
echo ""
echo "Step finished."
echo "-----------------------------------------------------------------------------------"

#Adding Ubuntu to PATH
echo "Step 7. Adding Ubuntu executable file to PATH"
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\Ubuntu", "User")
echo ""
echo "Success."
echo "-----------------------------------------------------------------------------------"

#Removing workdir
Remove-Item -Path $dir -Recurse -Force

echo "Process finished. This terminal will be closed in 30 seconds."
Start-Sleep -Seconds 30