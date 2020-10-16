$list = # csv file
$MoveTo = # in the right organizatial unit
Clear-Host

Function disablePc{
    
    Param(
        [string] $_AccountName,
        [string] $_MoveTo
    )
    Write-Host("Disable Account: $_AccountName")
    Write-Host("Move to OU: $MoveTo")

    Get-ADComputer $_AccountName | Set-ADComputer -Enabled $false
    Start-Sleep -s 2
    Get-ADComputer $_AccountName | Move-ADObject -TargetPath $MoveTo
    Start-Sleep -s 2
}

foreach($PC in $list){
    disablePc $PC.$_AccountName $PC.$_MoveTo
}