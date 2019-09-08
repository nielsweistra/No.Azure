$ScriptPath = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
Set-Location $ScriptPath
Import-Module Az.Resources

#Connect-AzRmAccount

New-AzResourceGroup -Name "NO-ASE-RG" -Location "West Europe" -Verbose
New-AzResourceGroupDeployment -ResourceGroupName "NO-ASE-RG" -Name "Tester" -TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json -Verbose