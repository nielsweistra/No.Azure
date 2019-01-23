$ScriptPath = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
Import-Module Az.Resources

#Connect-AzRmAccount
#Select-AzRmSubscription -SubscriptionName "NO"

New-AzResourceGroup -Name "NO-ASE-RG" -Location "West Europe" -Verbose
New-AzResourceGroupDeployment -ResourceGroupName "NO-ASE-RG" -Name "Tester" -TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json -Verbose