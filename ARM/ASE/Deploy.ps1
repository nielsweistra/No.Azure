Import-Module Az.Resources

#Connect-AzRmAccount
#Select-AzRmSubscription -SubscriptionName "NO"

New-AzResourceGroup -Name "NO-ASE-RG" -Location "West Europe" -Verbose
New-AzResourceGroupDeployment -Name NO -ResourceGroupName "NO-ASE-RG" -TemplateUri "https://noprovisionsa01.blob.core.windows.net/templates/ASE/azuredeploy.json?st=2019-01-19T23%3A01%3A43Z&se=2020-01-20T23%3A01%3A00Z&sp=rl&sv=2018-03-28&sr=c&sig=F8tTiCXnQTRPPC8wHj1W9evH0ZFCZakzh%2B%2FFeQHR3Do%3D" -Verbose