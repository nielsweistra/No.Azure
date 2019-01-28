$base64 = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("[path-cert.pfx]"))
$base64
