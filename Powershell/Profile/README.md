# Profile Management

This is to configure a pwoershell profile. Select which one you want and enable transcript for it.

## Project Goals
The objective is to configure your terminal to keep in mind where you are connected.
* Config.json
* Microsoft.Powershell_Profile.ps1
* Powershell-Profile.psm1

## Config.json
Contains the path of transcript file
Contains each profile you want to propose. For each profile, configure UPN, default path, privilege or role of account, color for this profile.
Example : C:\Users\<myname>\Documents\WindowsPowershell.

## Microsoft.Powershell_Profile
### Current Version
**Version: 0.1**

### History
- Sept 16, 2021 : Creation

### Using the script
Copy this file to your Powershell profile path.

## Powershell-Profile.psm1
### Current Version
**Version: 0.1**

### History
- Sept 16, 2021 : Creation

### Using the script
Copy this file to a new folder named "Powershell-Profile" under module folder of your powershell profile.
Example : C:\Users\<myname>\Documents\WindowsPowershell\Modules\Powershell-Profile.

## How to use
### Function LoadProfile
To load your profile, execute "loadprofile" command let.

### Function StartTranscript
To start transcript. The transcript file will be under the path you specified in json file.

### Function StopTranscript
To stop transcript. The transcript file will be under the path you specified in json file.

## Credits
Mathias Dumont

## License
A short snippet describing the license (MIT, Apache, etc.)

## Donate
If you appreciate my work and you want to buy me a beer, send :
* Bitcoin to <b>bc1qj7592q9xqn2x6k06c2amglyaq0lyyntvvdwz297n9pmjszz4njcs85tkl2</b>
* Ethereum to <b>0x72B0be70715914F4D76e4d78a70F97854a6c4934</b>