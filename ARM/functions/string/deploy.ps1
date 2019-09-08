
Set-Location $PSScriptRoot
Set-AzContext -Subscription NO
$random = -join ((33..126) | Get-Random -Count 6| % {[char]$_})
$deploymentID = (Get-Date -Format FileDateTime)

$ResourceGroupName = "$random-$deploymentID"

New-AzResourceGroup -ResourceGroupName $ResourceGroupName -Location 'West Europe' -Force

New-AzResourceGroupDeployment -Name "empty" -ResourceGroupName $ResourceGroupName -TemplateFile "empty.json" -Force -Verbose

Remove-AzResourceGroup -ResourceGroupName $ResourceGroupName -Force -Verbose