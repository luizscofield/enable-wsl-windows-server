# Script Owner: Luiz Scofield
# Creation Date: 04/01/2024

$commands={Set-ExecutionPolicy unrestricted -force; cd D:\Scripts; .\aux-enable-wsl.ps1}

Start-process PowerShell -verb runas -ArgumentList "-NoProfile -Command $commands"