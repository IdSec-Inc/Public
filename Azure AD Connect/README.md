# List synced Organizational Unit

This script extracts the Organizational Unit that are synced with Azure AD.

## Project Goals

* Check or verify the synced OU.

## Prerequisites

* Module AzureADADSyncConfig

## Using the script
List-Synced-OU.ps1

### Result
    Forest: idsec.inc
        Parition: idsec.inc
                DC=idsec,DC=inc
                OU=Office365,OU=Groups,DC=idsec,DC=inc
                OU=Sync,OU=Workstations,DC=idsec,DC=inc
    ---

## History

June, 10, 2020 : Creation

## Credits

Mathias Dumont

## License

A short snippet describing the license (MIT, Apache, etc.)
