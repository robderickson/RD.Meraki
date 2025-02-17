@{
	# Script module or binary module file associated with this manifest.
	RootModule        = 'RD.Meraki.psm1'

	# Version number of this module.
	ModuleVersion     = '0.0.1'

	# ID used to uniquely identify this module
	GUID              = '6d9fdd2c-63c9-4740-a622-f50920a159d7'

	# Author of this module
	Author            = 'Rob Derickson'

	# Company or vendor of this module
	CompanyName       = 'Unknown'

	# Copyright statement for this module
	Copyright         = ''

	# Description of the functionality provided by this module
	Description       = 'PowerShell Module for the Meraki Dashboard API'

	# Minimum version of the PowerShell engine required by this module
	PowerShellVersion = '7.2'

	# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
	FunctionsToExport = @(
		'Connect-RDMeraki'
		'Get-RDMerakiOrganization'
		'Get-RDMerakiNetwork'
	)

	# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
	CmdletsToExport   = @()

	# Variables to export from this module
	VariablesToExport = @()

	# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
	AliasesToExport   = @()

	# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData       = @{
		PSData = @{
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags         = @('Meraki')

			# A URL to the license for this module.
			LicenseUri   = 'https://opensource.org/licenses/MIT'

			# A URL to the main website for this project.
			ProjectUri   = ''
		}
	}
}
