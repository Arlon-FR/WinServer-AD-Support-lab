# Script para contornar o bloqueio WSUS em máquina de domínio e instalar o RSAT

$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing"
New-Item -Path $Path -Force -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path $Path -Name "RepairContentServerSource" -Value 2
Set-ItemProperty -Path $Path -Name "UseWindowsUpdate" -Value 2
Restart-Service wuauserv
Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0