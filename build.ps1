param(
	$Destination = $(Join-Path $PSScriptRoot 'dist')
)

nswag run $PSScriptRoot/RD.Meraki.nswag
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