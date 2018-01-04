########################################################
##
## SeInteract.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

function Send-SeKeys
{
<#
.SYNOPSIS

Send key strokes

.DESCRIPTION

Send-SeKeys sends key strokes to the specified element.

.PARAMETER Element

An element to send keystrokes

.PARAMETERS Keys

String to send ad input

.EXAMPLE

PS> Send-SeKeys -Element $element -Keys "Cheese!"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Position=1, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Keys
    )
    begin {}
    process 
    {
        $null = $Element.SendKeys($Keys)
    }
    end {}
}


function Submit-SeForm
{
<#
.SYNOPSIS

Submits a form

.DESCRIPTION

Submit-SeForm form associated with the specified element.

.PARAMETER Element

An element to locate the form

.EXAMPLE

PS> Submit-SeForm -Element $element

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element
    )
    begin {}
    process 
    {
        $null = $Element.Submit()
    }
    end {}
}


function Send-SeClick
{
<#
.SYNOPSIS

Clicks an element

.DESCRIPTION

Send-SeClick performs a click on the specified element.

.PARAMETER Element

An element to click

.PARAMETER Left

Switch to send left click (default)

.PARAMETER Right

Switch to send right click

.PARAMETER Script 

Use javascript to call click function

.EXAMPLE

PS> Send-SeClick -Element $element

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Mandatory=$false)]
        [switch] $Left,

        [Parameter(Mandatory=$false)]
        [switch] $Right,

        [Parameter(Mandatory=$false)]
        [switch] $Script,

        [Parameter(Mandatory=$false)]
        [switch] $MoveByOffset,

        [Parameter(Mandatory=$false)]
        [int] $XOffset,

        [Parameter(Mandatory=$false)]
        [int] $YOffset
    )
    begin {}
    process 
    {
        if ($Right)
        {
            $action = New-Object -TypeName  OpenQA.Selenium.Interactions.Actions -ArgumentList $Element.WrappedDriver
            $null = $action.ContextClick($Element)
            $null = $action.Perform()
        }
        elseif ($Left)
        {
            if ($Script)
            {
                $driver = $Element.WrappedDriver
                $null = $driver.ExecuteScript("arguments[0].click();", $Element)
            }
            else
            {
                $action = New-Object -TypeName  OpenQA.Selenium.Interactions.Actions -ArgumentList $Element.WrappedDriver
                $null = $action.MoveToElement($Element).Click().Perform()
            }
        }
        if ($MoveByOffset) {
            $action = New-Object -TypeName  OpenQA.Selenium.Interactions.Actions -ArgumentList $Element.WrappedDriver
            $null = $action.MoveToElement($Element, $XOffset, $YOffset).Click().Perform()
        }
        else
        {
            $null = $Element.Click()
        }
    }
    end {}
}



function Clear-SeElement
{
<#
.SYNOPSIS

Clears element content

.DESCRIPTION

Clear-SeElement clears content of the specified element

.PARAMETER Element

An element to clear

.EXAMPLE

PS> Clear-SeElement -Element $element

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element
    )
    begin {}
    process 
    {
        $null = $Element.Clear()
    }
    end {}
}
