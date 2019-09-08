
Set-Location $PSScriptRoot
Set-AzContext -Subscription NO
$deploymentID = (Get-Date -Format FileDateTime)

$ResourceGroupName = "temp"

New-AzResourceGroup -ResourceGroupName $ResourceGroupName -Location 'West Europe' -Force -Verbose

New-AzResourceGroupDeployment -Name "CreateMultipleResourcegroups-$deploymentID" -ResourceGroupName $ResourceGroupName -TemplateFile "CreateMultipleResourcegroups.json" -Force -Verbose

Remove-AzResourceGroup -ResourceGroupName $ResourceGroupName -Force