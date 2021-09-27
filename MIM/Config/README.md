# Configure Microsoft Identity Manager

This script estimates the number of objects in Azure Active Directory. As you know (maybe), your tenant can contains a limited number of objects in Azure AD.

## Project Goals

* Configure DCOM configuration for MIM.
* Configure WMI configuration for MIM.


## Using the script
### DCOM
DCOM-Config.ps1 -Principal "DOMAIN\<group or username>" -Computers ('server1', 'server2')

### WMI
WMI-Config.ps1 -Principal "DOMAIN\<group or username>" -Computers ('server1', 'server2')


## History

Dec, 16, 2020 : Creation

## Credits

Mathias Dumont

Brad Turner

## License

A short snippet describing the license (MIT, Apache, etc.)
