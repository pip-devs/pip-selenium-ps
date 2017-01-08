########################################################
##
## SeWindow.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

function Switch-SeDefault
{
<#
.SYNOPSIS

Switches to default content

.DESCRIPTION

Switch-SeDefault switches to default containt in the web browser

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.EXAMPLE

PS> Switch-SeDefault

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

        $null = $Driver.SwitchTo().DefaultContent()
    }
    end {}
}


function Switch-SeWindow
{
<#
.SYNOPSIS

Switches windows in the web browser

.DESCRIPTION

Switch-SeWindow switches to the specified browser window

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Name

The window name to switch to

.EXAMPLE

PS> Switch-SeWindow -Name "New Window"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$true)]
        [string] $Name
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        $null = $Driver.SwitchTo().Window($Name)
    }
    end {}
}


function Switch-SeFrame
{
<#
.SYNOPSIS

Switches to frame in the web browser

.DESCRIPTION

Switch-SeFrame switches to the specified browser frame

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Name

The frame id or name to switch to

.PARAMETER Element

The frame element to switch to

.PARAMETER Index

The frame index to switch to

.PARAMETER Parent

The parent frame to switch to

.EXAMPLE

# Switch to frame by element
PS> Switch-SeFrame -Element $element

# Switch to parent frame
PS> Switch-SeFrame -Parent

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Name = '',

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [int] $Index = -1,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [switch] $Parent
    )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}

        if ($Element -ne $null)
        {
            $null = $Driver.SwitchTo().Frame($Element)
        }
        elseif ($Name -ne $null -and $Name -ne '') 
        {
            $null = $Driver.SwitchTo().Frame($Name)
        }
        elseif ($Index -ne $null -and $Index -ge 0) 
        {
            $null = $Driver.SwitchTo().Frame($Index)
        }
        elseif ($Parent) 
        {
            $null = $Driver.SwitchTo().ParentFrame()
        }
    }
    end {}
}
