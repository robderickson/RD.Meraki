param(
	$Destination = $(Join-Path $PSScriptRoot 'dist')
)

nswag run $PSScriptRoot/RD.Meraki.nswag
$content = (Get-Content $PSScriptRoot/RD.Meraki.ApiClient/RD.Meraki.ApiClient.cs).Replace('https://api.meraki.com/{basepath}', 'https://api.meraki.com/api/v1')
Set-Content $PSScriptRoot/RD.Meraki.ApiClient/RD.Meraki.ApiClient.cs $content
$outDir = New-Item -ItemType Directory -Force $Destination

try {
	$binDir = (Join-Path $outDir 'bin')
	Push-Location $PSScriptRoot/RD.Meraki.ApiClient
	dotnet publish -o $binDir
} finally {
	Pop-Location
}

Copy-Item $PSScriptRoot/RD.Meraki.psd1, $PSScriptRoot/RD.Meraki.psm1 -Destination $outDir

Write-Host -Fore Green "Module Build Complete and available in $outDir"