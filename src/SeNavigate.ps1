########################################################
##
## SeNavigate.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

function Open-SePage
{
<#
.SYNOPSIS

Opens a new page by url

.DESCRIPTION

Open-SePage opens a web page by its url

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Url

A page url to open

.EXAMPLE

PS> Open-SePage -Url "http://www.google.com"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Position=1, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Url
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.Navigate().GoToUrl($Url)
    }
    end {}
}


function Move-SeForward
{
<#
.SYNOPSIS

Moves forward through page history

.DESCRIPTION

Move-SeForward moves forward through page history

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Move-SeForward

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.Navigate().Forward()
    }
    end {}
}


function Move-SeBack
{
<#
.SYNOPSIS

Moves backward through page history

.DESCRIPTION

Move-SeBack moves backward through page history

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Move-SeBack

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.Navigate().Back()
    }
    end {}
}


function Move-SeForward
{
<#
.SYNOPSIS

Moves forward through page history

.DESCRIPTION

Move-SeForward moves forward through page history

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Move-SeForward

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.Navigate().Forward()
    }
    end {}
}

function Reset-SePage
{
<#
.SYNOPSIS

Refreshes the current page

.DESCRIPTION

Reset-SePage refreshes the current page

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Reset-SePage

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.Navigate().Refresh()
    }
    end {}
}
