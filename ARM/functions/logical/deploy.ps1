
Set-Location $PSScriptRoot
Set-AzContext -Subscription NO
$random = -join ((65..90 + 97..122) | Get-Random -Count 6| % {[char]$_})
$deploymentID = (Get-Date -Format FileDateTime)

$ResourceGroupName = "$random-$deploymentID"

New-AzResourceGroup -ResourceGroupName $ResourceGroupName -Location 'West Europe' -Force

New-AzResourceGroupDeployment -Name "if-$deploymentID" -ResourceGroupName $ResourceGroupName -TemplateFile "if.json" -Force -Verbose

Remove-AzResourceGroup -ResourceGroupName $ResourceGroupName -Force