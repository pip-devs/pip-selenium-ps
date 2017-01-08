########################################################
##
## SeAlert.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

function Switch-SeAlert
{
<#
.SYNOPSIS

Switches to alert popup

.DESCRIPTION

Switch-SeAlert switches to alert popup window

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Switch-SeAlert

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        Write-Output $Driver.SwitchTo().Alert()
    }
    end {}
}


function Send-SeAlertAccept
{
<#
.SYNOPSIS

Accepts alert popup

.DESCRIPTION

Send-SeAlertAccept accepts the alert popup window

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Send-SeAlertAccept

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.SwitchTo().Alert().Accept()
    }
    end {}
}


function Send-SeAlertDismiss
{
<#
.SYNOPSIS

Dismisses alert popup

.DESCRIPTION

Send-SeAlertDismiss dismisses the alert popup window

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Send-SeAlertAccept

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.SwitchTo().Alert().Dismiss()
    }
    end {}
}


function Send-SeAlertKeys
{
<#
.SYNOPSIS

Sends keystrokes to alert popup

.DESCRIPTION

Send-SeAlertKeys sends keystrokes to alert popup window

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Keys

A string with user input

.EXAMPLE

PS> Send-SeAlertKeys -Keys 'Do it'

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Keys
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.SwitchTo().Alert().SendKeys($Keys)
    }
    end {}
}
