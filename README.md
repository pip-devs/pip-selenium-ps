# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br/> Selenium WebDriver module for PowerShell

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

## Installation

* Checkout the module from github repository at https://github.com/pip-devs/pip-selenium-ps
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