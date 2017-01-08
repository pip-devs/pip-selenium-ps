########################################################
##
## SePage.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

function Get-SePageTitle 
{
<#
.SYNOPSIS

Gets the page title

.DESCRIPTION

Get-SePageTitle gets the title of the current page

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Get-SePageTitle

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

        Write-Output $Driver.Title
    }
    end {}
}


function Get-SePageUrl 
{
<#
.SYNOPSIS

Gets the page url

.DESCRIPTION

Get-SePageTitle gets the url of the current page

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Get-SePageUrl

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

        Write-Output $Driver.Url
    }
    end {}
}


function Get-SePageSource
{
<#
.SYNOPSIS

Gets the page source

.DESCRIPTION

Get-SePageSource gets the source of the current page

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Get-SePageSource

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

        Write-Output $Driver.PageSource
    }
    end {}
}
