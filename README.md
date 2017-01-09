# <img src="https://github.com/pip-devs/pip-selenium-ps/raw/master/artifacts/logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br/> Selenium WebDriver module for PowerShell

This PowerShell module provides interface for [Selenium WebDriver](http://www.seleniumhq.org/).
It can be used for testing web pages or automation of legacy web applications.

The module allows to perform most operations supported by .NET web driver:

* Start and stop driver, managing open sessions
* Open pages, reading page title or source
* Find one or multiple elements by id, name, css selector or xpath
* Navigate back and forth browser history
* Switch between page frames
* Send clicks or keystrokes, submit forms
* Manage alert popups

## Commands

* **Clear-SeElement** - Clears element content
* **Find-SeElement** - Finds DOM element by specified criteria
* **Find-SeElements** - Finds DOM elements by specified criteria
* **Get-SeAttribute** - Gets an element attribute
* **Get-SeCssProperty** - Gets an element CSS property
* **Get-SeDriver** - Gets currently loaded web driver
* **Get-SePageSource** - Gets the page source
* **Get-SePageTitle** - Gets the page title
* **Get-SePageUrl** - Gets the page url
* **Get-SeText** - Gets an element text
* **Move-SeBack** - Moves backward through page history
* **Move-SeForward** - Moves forward through page history
* **Open-SePage** - Opens a new page by url
* **Reset-SePage** - Refreshes the current page
* **Select-SeDriver** - Selects default web driver
* **Send-SeAlertAccept** - Accepts alert popup
* **Send-SeAlertDismiss** - Dismisses alert popup
* **Send-SeAlertKeys** - Sends keystrokes to alert popup
* **Send-SeClick** - Clicks an element
* **Send-SeKeys** - Send key strokes
* **Start-SeDriver** - Starts selenium web driver
* **Stop-SeDriver** - Stops selenium web driver
* **Submit-SeForm** - Submits a form
* **Switch-SeAlert** - Switches to alert popup
* **Switch-SeDefault** - Switches to default content
* **Switch-SeFrame** - Switches to frame in the web browser
* **Switch-SeWindow** - Switches windows in the web browser
* **Wait-SeElement** - Wait until specified dynamic DOM element appear on the page

## Installation

* Checkout the module from github repository at https://github.com/pip-devs/pip-selenium-ps

```bash
git clone https://github.com/pip-devs/pip-selenium-ps
```

* Add parent folder to **PSModulePath** environment variable if it is not there yet
* Install Chrome, PhantomJS or another web browser you intend to use
* Load the module as

```powershell
Import-Module pip-selenium-ps
```

## Usage

```powershell
# Load selenium module
Import-Module pip-selenium-ps

# Create a new instance of the Chrome driver
Start-SeDriver -Type Chrome

# And now use this to visit Google
Open-SePage -Url http://www.google.com

# Find the text input element by its name
$element = Find-SeElement -Name q

# Enter something to search for
Send-SeKeys -Element $element -Keys Cheese!

# Now submit the form. WebDriver will find the form for us from the element
Submit-SeForm -Element $element

# Check the title of the page
Write-Host "Page title is: $(Get-SePageTitle)"

# Google's search is rendered dynamically with JavaScript.
# Wait for the page to load, timeout after 10 seconds
Wait-SeElement -PartialTitle cheese! -Seconds 10

# Close the browser
Stop-SeDriver
```

## Acknowledgements

This module created and maintained by **Sergey Seroukhov**.

Many thanks to contibutors, who put their time and talant into making this project better:
- **Nick Jimenez**, BootBarn Inc.
