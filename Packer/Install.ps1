$subscriptionId = "8b32203d-d655-41b1-84a7-2f119b31dc8a"
Login-AzAccount
Set-AzContext -Subscription $subscriptionId
$rgName = $env:UserName + "vs2017image"
$location = "West Europe"
New-AzureRmResourceGroup -Name $rgName -Location $location
$storageAccountName = $rgName
New-AzureRmStorageAccount -ResourceGroupName $rgName -AccountName $storageAccountName -Location $location -SkuName "Standard_LRS"
$spDisplayName = $env:UserName + "vs2017sp"
$spClientSecret = "XHsjplhIRMkMoL72zPsUUTNIndIWO5vecdbhbaX3N/+7z0q6S9qLBuD0plwp1owuiUwEzClFdvf3NUakBMFEc//I9T5gXT5YQY6GQ0YRwGwQomxcKgFTRWbc/LD4ezM2bOkKHofaIMnPHVChcFcc1FDHPvDgK8IlFBta5eirjT0="
$SpClientAppID = [guid]::NewGuid()
$psadCredential = New-Object Microsoft.Azure.Commands.ActiveDirectory.PSADPasswordCredential

#$sp = New-AzureRmADServicePrincipal -DisplayName $spDisplayName -Password (ConvertTo-SecureString $spClientSecret -AsPlainText -Force)
$startDate = Get-Date
$psadCredential.StartDate = $startDate
$psadCredential.EndDate = $startDate.AddYears(1)
$psadCredential.Password = $spClientSecret
$psadCredential.KeyId = $SpClientAppID

$sp = New-AzADServicePrincipal -DisplayName $spDisplayName -PasswordCredential $psadCredential
$spAppId = $sp.ApplicationId
$spClientId = $sp.ApplicationId
$spObjectId = $sp.Id
Sleep 40
New-AzureRmRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $spAppId
$sub = Get-AzureRmSubscription -SubscriptionId $subscriptionId
$tenantId = $sub.TenantId
"", "Note this variable-setting script for running Packer with these Azure resources in the future:", "==============================================================================================", "`$spClientId = `"$spClientId`"", "`$spClientSecret = `"$spClientSecret`"", "`$subscriptionId = `"$subscriptionId`"", "`$tenantId = `"$tenantId`"", "`$spObjectId = `"$spObjectId`"", "`$location = `"$location`"", "`$rgName = `"$rgName`"", "`$storageAccountName = `"$storageAccountName`"", ""
packer.exe build -var "client_id=45cde390-677e-4f9a-af6f-01a585e44829" -var "client_secret=$($spClientSecret)" -var "subscription_id=$($subscriptionId)" -var "tenant_id=$($tenantId)" -var "object_id=$($spObjectId)" -var "location=$($location)" -var "resource_group=$($rgName)" -var "storage_account=$($storageAccountName)" .\win\vs2017-Server2016-Azure.json