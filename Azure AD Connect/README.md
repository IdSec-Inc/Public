# Azure AD Connect

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

June 10, 2020 : Creation

## Credits

Mathias Dumont

## License

A short snippet describing the license (MIT, Apache, etc.)

## Donate
If you appreciate my work and you want to buy me a beer, send :
* Bitcoin to <b>bc1qj7592q9xqn2x6k06c2amglyaq0lyyntvvdwz297n9pmjszz4njcs85tkl2</b>
* Ethereum to <b>0x72B0be70715914F4D76e4d78a70F97854a6c4934</b>