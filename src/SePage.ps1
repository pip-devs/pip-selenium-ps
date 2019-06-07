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

function Save-SeScreenshot
{
<#
.SYNOPSIS

Save current page screenshot as a file

.DESCRIPTION

Save-SeScreenshot save current page screenshot as a file

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER OutName

An output screenshot file name (Default: screenshot.png)

.EXAMPLE

PS> Save-SeScreenshot

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Position=1, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $OutName = "screenshot.png"
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        # Save file to current directory if passed only file name, without full path
        if (($OutName.IndexOf("\") -eq -1) -and ($OutName.IndexOf("/") -eq -1)){
            $OutName = (Resolve-Path .\).Path + $OutName
        }

        $Driver.GetScreenshot().SaveAsFile($OutName)
    }
    end {}
}
