using namespace RD.Meraki
Add-Type -Path $PSScriptRoot/bin/RD.Meraki.ApiClient.dll
$ErrorActionPreference = 'Stop'


function Connect-RDMeraki {
	[CmdletBinding()]
	[OutputType([RD.Meraki.ApiClient])]
	param(
		[ValidateNotNullOrEmpty()]
		#Specify your API Key ID as the username and the API Key as the password
		[securestring]$ApiKey,
		#Replace any existing connections
		[Switch]$Force,
		#Dont set as the current client, return only
		[Switch]$NoDefault

	)

	if ([RD.Meraki.CurrentClient]::ApiClient -and -not $Force) {
		Write-Warning 'A connection is already established. Use -Force to reconnect.'
		return [RD.Meraki.CurrentClient]::ApiClient
	}

	$newClient = [RD.Meraki.ApiClient]::new()

	$newClient.AuthToken = ConvertFrom-SecureString -SecureString $ApiKey -AsPlainText
	if (-not $NoDefault) {
		[RD.Meraki.CurrentClient]::ApiClient = $newClient
	}

	return [RD.Meraki.CurrentClient]::ApiClient
}

function Assert-Client ($Client) {
	if (-not $Client) {
		throw 'No client is connected. Use Connect-RVnc to connect.'
	}

}

function Get-RDMerakiOrganization {
	[CmdletBinding()]
	[OutputType([RD.Meraki.Organization])]
	param(
		[RD.Meraki.ApiClient]$Client = [RD.Meraki.CurrentClient]::ApiClient
	)

	Assert-Client $Client
	return $Client.GetOrganizations
}

function Get-RDMerakiNetwork {
	[CmdletBinding()]
	[OutputType([RD.Meraki.Network])]
	param(
		[string]$OrganizationId,
		[string]$NetworkId,
		[RD.Meraki.ApiClient]$Client = [RD.Meraki.CurrentClient]::ApiClient
	)

	Assert-Client $Client
	if ([String]::IsNullOrWhiteSpace($NetworkId)) {
		return $Client.GetOrganizationNetworks($OrganizationId)
	} else {
		return $Client.GetNetwork($NetworkId).Groups
	}
}