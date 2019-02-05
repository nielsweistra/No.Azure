New-AzResourceGroup -Name NO-KV-RG -Location "West Europe"
New-AzResourceGroupDeployment -Name "NO-KV-RG-Deployment-$((Get-Date).ToString("yyyyMMddhhmmss"))" -ResourceGroupName NO-KV-RG `
  -TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json -Verbose