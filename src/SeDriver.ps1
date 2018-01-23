########################################################
##
## SeDriver.ps1
## Selenium module for PowerShell
## copyrights (c) Conceptual Vision Consilting LLC 2016-2017
##
#######################################################

# $path = $PSScriptRoot + '/lib/'

#Add-Type -Path ($path + "Selenium.WebDriverBackedSelenium.dll")
#Add-Type -Path ($path + "ThoughtWorks.Selenium.Core.dll")
#Add-Type -Path ($path + "WebDriver.dll")
#Add-Type -Path ($path + "WebDriver.Support.dll")

# $dll = [System.Reflection.Assembly]::LoadFile($path + "Selenium.WebDriverBackedSelenium.dll")
# $dll = [System.Reflection.Assembly]::LoadFile($path + "ThoughtWorks.Selenium.Core.dll")
# $dll = [System.Reflection.Assembly]::LoadFile($path + "WebDriver.dll")
# $dll = [System.Reflection.Assembly]::LoadFile($path + "WebDriver.Support.dll")

function Start-SeDriver
{
<#
.SYNOPSIS

Starts selenium web driver

.DESCRIPTION

Start-SeDriver starts a new web driver of specified type
and returns a reference to the driver

.PARAMETER Type

A type of the selenium driver. Default value if '

.EXAMPLE

PS> $driver = Start-SeDriver -Type "chrome"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $Type = 'phantomjs',
        [Parameter(Mandatory=$false, Position = 1)]
        [string] $Url = $null
    )
    begin {}
    process 
    {
        $Type = $Type.ToUpperInvariant()

        if ($Type -eq 'PHANTOMJS' -or $Type -eq 'PHANTOM')
        {
            $service = [OpenQA.Selenium.PhantomJS.PhantomJSDriverService]::CreateDefaultService()
            #$service.LogFile = "C:/Temp/Phantomjs.log"
            $service.HideCommandPromptWindow = $true;

            $driver = New-Object OpenQA.Selenium.PhantomJS.PhantomJSDriver

            if ($Url -ne $null) {
                $driver.Url = $Url
            }
        }
        elseif ($Type -eq 'CHROME')
        {
            $driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver
        }
        else
        {
            throw 'Unknown or unsupported webdriver ' + $Type
        }

        $Script:SeDriver = $driver
        Write-Output $driver
    }
    end {}
}

function Get-SeDriver 
{
<#
.SYNOPSIS

Gets currently loaded web driver

.DESCRIPTION

Get-SeDriver gets currently loaded selenium web driver

.EXAMPLE

PS> Get-SeDriver

#>
    [CmdletBinding()]
    param
    (
    )
    begin {}
    process 
    {
        Write-Output $SeDriver
    }
    end {}
}


function Select-SeDriver 
{
<#
.SYNOPSIS

Selects default web driver

.DESCRIPTION

Select-SeDriver selects selenium web driver that will be used by default in Selenium commands

.PARAMETER Driver

An object reference to started selenium web driver

.EXAMPLE

PS> Select-SeDriver -Driver $driver

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process 
    {
        $Script:SeDriver = $Driver

        Write-Output $Driver
    }
    end {}
}


function Stop-SeDriver 
{
<#
.SYNOPSIS

Stops selenium web driver

.DESCRIPTION

Stop-SeDriver stops previously started selenium web driver.
If no driver is specified, then the currently selected driver is taken

.PARAMETER Driver

A web driver object

.EXAMPLE

# Stops current driver
PS> Stop-SeDriver

# Stops driver by reference
PS> Stop-SeDriver -Driver $driver

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [OpenQA.Selenium.IWebDriver] $Driver
    )
    begin {}
    process {
        $Driver = if ($Driver -ne $null) {$Driver} else {$SeDriver}
       
        if ($Driver -ne $null)
        {
            $null = $Driver.Quit()
        }

        if ($SeDriver -eq $Driver) 
        {
            $Script:SeDriver = $null
        }
    }
    end {}
}
