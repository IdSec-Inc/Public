# Count objects in Azure AD

This script estimates the number of objects in Azure Active Directory. As you know (maybe), your tenant can contains a limited number of objects in Azure AD.

## Project Goals

* Estimate the number of objects.

## Prerequisites

* Module [AzureAD](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-5.2.0)

## Using the script
### With current credential
Count-AzureAD-Objects.ps1 -CurrentCredential

### With another current credential
Count-AzureAD-Objects.ps1

### Result
    Devices                    : 9
    Groups                     : 37
    Roles                      : 12
    DeletedApplications        : 0
    Users                      : 20
    ServicePrincipals          : 358
    ApplicationProxyConnectors : 0
    ExtensionProperties        : 15
    Contracts                  : 0
    Contacts                   : 0
    Applications               : 14

    Total : 465

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

Dec 10, 2020 : Creation

## Credits

Mathias Dumont (IdSec)

Pierre (Microsoft)

## License

A short snippet describing the license (MIT, Apache, etc.)

## Donate
If you appreciate my work and you want to buy me a beer, send :
* Bitcoin to <b>bc1qj7592q9xqn2x6k06c2amglyaq0lyyntvvdwz297n9pmjszz4njcs85tkl2</b>
* Ethereum to <b>0x72B0be70715914F4D76e4d78a70F97854a6c4934</b>