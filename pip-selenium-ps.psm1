########################################################
##
## pip-selenium-ps.psm1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

# Script variables
$Script:SeDriver = $null

$path = $PSScriptRoot
if ($path -eq "") { $path = "." }

. "$($path)/src/SeDriver.ps1"
. "$($path)/src/SePage.ps1"
. "$($path)/src/SeNavigate.ps1"
. "$($path)/src/SeElement.ps1"
. "$($path)/src/SeInteract.ps1"
. "$($path)/src/SeSwitch.ps1"
. "$($path)/src/SeAlert.ps1"
