# Configure Microsoft Identity Manager

These scripts configure DCOM and WMI components for MIM.

## Project Goals

* Configure DCOM configuration for MIM.
* Configure WMI configuration for MIM.

## Current Version
### DCOM
**Version: 0.3**

### Current Version
**Version: 0.3**

## Using the script
### DCOM
DCOM-Config.ps1 -Principal "DOMAIN\<group or username>" -Computers ('server1', 'server2')

### WMI
WMI-Config.ps1 -Principal "DOMAIN\<group or username>" -Computers ('server1', 'server2')

## History

Dec, 16, 2020 : Creation

## Credits

Mathias Dumont (IdSec)

Brad Turner (bturner@ensynch.com)

## License

A short snippet describing the license (MIT, Apache, etc.)
