[![License](https://img.shields.io/badge/License-MIT-blue.svg)]()
[![Minimum Supported PowerShell Version](https://img.shields.io/badge/PS-5.1-blue.svg)]()

## Table of Contents
- [Introduction](#introduction)
- [Azure](#Azure)
  - [Template ARM](#Template-ARM)
    - ADFS
- [Azure AD](#Azure-AD)
  - [Count Objects](#Count-Objects)
- [Azure AD Connect](#Azure-AD-Connect)
  - [List Synced OU](#List-Synced-OU)
- [Cryptographic](#Cryptographic)
  - [Cipher](#Cipher)
- [MIM](#MIM)
  - [Config](#config)
  - [Poc to prod](#poc-to-prod)
- [Powershell](#Powershell)
  - [Profile](#Profile)
## Introduction

## Azure
### Template ARM
* [ADFS](https://github.com/IdSec-Inc/Public/blob/master/Azure/Template%20ARM/ADFS/README.txt)

## Azure AD
### Count objects
Scripts to estimate number of objects.
Read the [Readme.md](https://github.com/IdSec-Inc/Public/blob/master/Azure%20AD/Count%20Objects/README.md)

## Azure AD Connect
### List synced OU
Script to list Organizational unit in AAD Connect.
Read the [Readme.md](https://github.com/IdSec-Inc/Public/blob/master/Azure%20AD%20Connect/README.md)
* [List-Synced-OU.ps1](https://github.com/IdSec-Inc/Public/blob/master/Azure%20AD%20Connect/List%20Synced%20OU/List-Synced-OU.ps1)

## Cryptographic
### Cipher
Script to list cipher config.
Read the [Readme.md](https://github.com/IdSec-Inc/Public/blob/master/Cryptographic/Cipher/README.md)

## MIM
### Config
Scripts to configure MIM.
Read the [Readme.md](https://github.com/IdSec-Inc/Public/blob/master/MIM/Config/README.md)
* [DCOM-config.ps1](https://github.com/IdSec-Inc/Public/blob/master/MIM/Config/DCOM-config.ps1)
* [WMI-config.ps1](https://github.com/IdSec-Inc/Public/blob/master/MIM/Config/WMI-config.ps1)

### Poc to prod
Scripts to export poc/lab/dev to production environment.
Read the [Readme.md](https://github.com/IdSec-Inc/Public/blob/master/MIM/Poc%20to%20Prod/README.md)

## Powershell
### Profile
* [Config.json](https://github.com/IdSec-Inc/Public/blob/master/MIM/Config/DCOM-config.ps1)
* [Microsoft.Powershell-Profile.ps1](https://github.com/IdSec-Inc/Public/blob/master/MIM/Config/WMI-config.ps1)
* [Powershell-Profile.psm1](https://github.com/IdSec-Inc/Public/blob/master/MIM/Config/WMI-config.ps1)

## Contributing
If you wish to contribute to this project, please read the [Contributing.md](/.github/CONTRIBUTING.md)
document first. We would be very grateful of any contributions.

## Cmdlets
A list of Cmdlets in the _CosmosDB PowerShell module_ can be found by running the
following PowerShell commands:

```PowerShell
Import-Module -Name CosmosDB
Get-Command -Module CosmosDB
```

Help on individual Cmdlets can be found in the built-in Cmdlet help:

```PowerShell
Get-Help -Name Get-CosmosDBUser
```

The details of the cmdlets contained in this module can also be
found in the [wiki](https://github.com/PlagueHO/CosmosDB/wiki).

## Change Log
For a list of changes to versions, see the [CHANGELOG.md](CHANGELOG.md) file.

## Links
- [GitHub Repository](https://github.com/PlagueHO/CosmosDB/)
- [Blog](https://dscottraynsford.wordpress.com/)

## Connect with me :
[<img align="left" alt="codeSTACKr | Twitter" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/twitter.svg" />][twitter]
[<img align="left" alt="codeSTACKr | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin]
<br />
<!-- This section you create this variables that are used above -->
[twitter]: https://twitter.com/IdSec_inc
[linkedin]: https://www.linkedin.com/in/idsec-inc-1881b21a9/