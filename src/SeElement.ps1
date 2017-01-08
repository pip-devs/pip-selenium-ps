########################################################
##
## SeElement.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

function Find-SeElement
{
<#
.SYNOPSIS

Finds DOM element by specified criteria

.DESCRIPTION

Find-SeElement finds a single DOM element by variety of different criteria

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Element

A parent element to start search from

.PARAMETER Id

Element id to search for

.PARAMETER Class

CSS class to search for

.PARAMETER Name

Element name to search for

.PARAMETER Tag

Element tag to search for

.PARAMETER Selector

CSS selector to search for

.PARAMETER XPath

XPath to search for 

.PARAMETER Link

Link text to search for

.PARAMETER PartialLink

Partial link text to search for

.EXAMPLE

# Find element by its id
PS> Find-SeElement -Id "submit_button"

# Find element by CSS selector
PS> Find-SeElement -Selector "img[src='5NewIcons.png']"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Id,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Class,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Name,
 
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Tag,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Selector,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $XPath,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Link,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $PartialLink
   )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}
        $context = if ($Element -ne $null) {$Element} else {$Driver}

        if ($Id -ne $null -and $Id -ne '') 
        {
            Write-Output $context.FindElementById($Id)
        }
        elseif ($Class -ne $null -and $Class -ne '')
        {
            Write-Output $context.FindElementByClassName($Class)
        }
        elseif ($Name -ne $null -and $Name -ne '')
        {
            Write-Output $context.FindElementByName($Name)
        }
        elseif ($Tag -ne $null -and $Tag -ne '')
        {
            Write-Output $context.FindElementByTagName($Tag)
        }
        elseif ($Selector -ne $null -and $Selector -ne '')
        {
            Write-Output $context.FindElementByCssSelector($Selector)
        }
        elseif ($XPath -ne $null -and $XPath -ne '')
        {
            Write-Output $context.FindElementByXPath($XPath)
        }
        elseif ($Link -ne $null -and $Link -ne '')
        {
            Write-Output $context.FindElementByLinkText($Link)
        }
        elseif ($PartialLink -ne $null -and $PartialLink -ne '')
        {
            Write-Output $context.FindElementByPartialLinkText($PartialLink)
        }
    }
    end {}
}


function Find-SeElements
{
<#
.SYNOPSIS

Finds DOM elements by specified criteria

.DESCRIPTION

Find-SeElements finds all DOM elements by variety of different criteria

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Element

A parent element to start search from

.PARAMETER Id

Element id to search for

.PARAMETER Class

CSS class to search for

.PARAMETER Name

Element name to search for

.PARAMETER Tag

Element tag to search for

.PARAMETER Selector

CSS selector to search for

.PARAMETER XPath

XPath to search for 

.PARAMETER Link

Link text to search for

.PARAMETER PartialLink

Partial link text to search for

.EXAMPLE

# Find all elements with the same id
PS> Find-SeElements -Id "submit_button"

# Find elements by CSS selector
PS> Find-SeElements -Selector "img[src='5NewIcons.png']"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Id,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Class,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Name,
 
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Tag,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Selector,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $XPath,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Link,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $PartialLink
   )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}
        $context = if ($Element -ne $null) {$Element} else {$Driver}

        if ($Id -ne $null -and $Id -ne '') 
        {
            Write-Output $context.FindElementsById($Id)
        }
        elseif ($Class -ne $null -and $Class -ne '')
        {
            Write-Output $context.FindElementsByClassName($Class)
        }
        elseif ($Name -ne $null -and $Name -ne '')
        {
            Write-Output $context.FindElementsByName($Name)
        }
        elseif ($Tag -ne $null -and $Tag -ne '')
        {
            Write-Output $context.FindElementsByTagName($Tag)
        }
        elseif ($Selector -ne $null -and $Selector -ne '')
        {
            Write-Output $context.FindElementsByCssSelector($Selector)
        }
        elseif ($XPath -ne $null -and $XPath -ne '')
        {
            Write-Output $context.FindElementsByXPath($XPath)
        }
        elseif ($Link -ne $null -and $Link -ne '')
        {
            Write-Output $context.FindElementsByLinkText($Link)
        }
        elseif ($PartialLink -ne $null -and $PartialLink -ne '')
        {
            Write-Output $context.FindElementsByPartialLinkText($PartialLink)
        }
    }
    end {}
}


function Wait-SeElement
{
<#
.SYNOPSIS

Wait until specified dynamic DOM element appear on the page

.DESCRIPTION

Wait-SeElement waits until dynamic DOM element set by variety of different criteria
appear on the page.

.PARAMETER Driver

An optional object reference to started selenium web driver (Default: current driver)

.PARAMETER Element

A parent element to start search from

.PARAMETER Id

Element id to wait for

.PARAMETER Class

CSS class to wait for

.PARAMETER Name

Element name to wait for

.PARAMETER Tag

Element tag to wait for

.PARAMETER Selector

CSS selector to wait for

.PARAMETER XPath

XPath to wait for 

.PARAMETER Link

Link text to wait for

.PARAMETER PartialLink

Partial link text to wait for

.PARAMETER Title

Page title to wait for


.PARAMETER PartialTitle

Partial page title to wait for

.EXAMPLE

# Find all elements with the same id
PS> Find-SeElements -Id "submit_button"

# Find elements by CSS selector
PS> Find-SeElements -Selector "img[src='5NewIcons.png']"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Id,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Class,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Name,
 
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Tag,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Selector,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $XPath,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Link,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $PartialLink,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $Title,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [string] $PartialTitle,

        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [int] $Seconds = 10
   )
    begin {}
    process 
    {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}
        $context = if ($Element -ne $null) {$Element} else {$Driver}

        if ($Id -ne $null -and $Id -ne '') 
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsById($Id).Count -gt 0 }
            )
        }
        elseif ($Class -ne $null -and $Class -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByClassName($Class).Count -gt 0 }
            )
        }
        elseif ($Name -ne $null -and $Name -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByName($Name).Count -gt 0 }
            )
        }
        elseif ($Tag -ne $null -and $Tag -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByTagName($Tag).Count -gt 0 }
            )
        }
        elseif ($Selector -ne $null -and $Selector -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByCssSelector($Selector).Count -gt 0 }
            )
        }
        elseif ($XPath -ne $null -and $XPath -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByXPath($XPath).Count -gt 0 }
            )
        }
        elseif ($Link -ne $null -and $Link -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByLinkText($Link).Count -gt 0 }
            )
        }
        elseif ($PartialLink -ne $null -and $PartialLink -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $context.FindElementsByPartialLinkText($PartialLink).Count -gt 0 }
            )
        }
        elseif ($Title -ne $null -and $Title -ne '')
        {
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $d.Title -eq $Title }
            )
        }
        elseif ($PartialTitle -ne $null -and $PartialTitle -ne '')
        {
            $PartialTitle = ('*' + $PartialTitle + '*')
            $criteria = [System.Func[OpenQA.Selenium.IWebDriver, bool]](
                { param($d) $d.Title -like $PartialTitle }
            )
        }
        else
        {
            $criteria = $null
        }

        $delay = New-TimeSpan -Seconds $Seconds
        $wait = New-Object OpenQA.Selenium.Support.UI.WebDriverWait -ArgumentList ($Driver, $delay)
        if ($criteria -ne $null)
        {
            $wait.Until($criteria)
        }
    }
    end {}
}

function Get-SeAttribute
{
<#
.SYNOPSIS

Gets an element attribute

.DESCRIPTION

Get-SeAttribute gets attribute from specified element by its name

.PARAMETER Element

An element to get attribute from

.PARAMETER Attribute

An attribute name

.EXAMPLE

PS> Get-SeAttribute -Element $element -Attribute "name"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Position=1, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Attribute
    )
    begin {}
    process 
    {
        Write-Output $Element.GetAttribute($Attribute)
    }
    end {}
}

function Get-SeAttribute
{
<#
.SYNOPSIS

Gets an element attribute

.DESCRIPTION

Get-SeAttribute gets attribute from specified element by its name

.PARAMETER Element

An element to get attribute from

.PARAMETER Attribute

An attribute name

.EXAMPLE

PS> Get-SeAttribute -Element $element -Attribute "name"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Position=1, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Attribute
    )
    begin {}
    process 
    {
        Write-Output $Element.GetAttribute($Attribute)
    }
    end {}
}

function Get-SeText
{
<#
.SYNOPSIS

Gets an element text

.DESCRIPTION

Get-SeText gets text from specified element by its name

.PARAMETER Element

An element to get text from

.EXAMPLE

PS> Get-SeText -Element $element

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element
    )
    begin {}
    process 
    {
        Write-Output $Element.Text
    }
    end {}
}


function Get-SeCssProperty
{
<#
.SYNOPSIS

Gets an element CSS property

.DESCRIPTION

Get-SeCssProperty gets CSS value from specified element by its name

.PARAMETER Element

An element to get attribute from

.PARAMETER Property

A CSS property name

.EXAMPLE

PS> Get-SeCssProperty -Element $element -Property "color"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebElement] $Element,

        [Parameter(Position=1, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Property
    )
    begin {}
    process 
    {
        Write-Output $Element.GetCssValue($Property)
    }
    end {}
}
