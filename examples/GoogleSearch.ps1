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
