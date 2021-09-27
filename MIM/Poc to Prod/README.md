# Poc to Prod

These scripts will help you to export your POC configuration and import it in your production environment.

## Project Goals

* Export configuration.
* Compare the configuration between servers.
* Import configuration to the production
* Resume the Undone imports.


## Using these scripts
### Export
Export-Config.ps1 -SourceUri 'http://servername:5725' -DestinationUri 'http://servername:5725'

#### Result
    2020-12-02_09-31
        Destination-Policy.xml
        Destination-Schema.xml
        Source-Policy.xml
        Source-Schema.xml
    ---

### Compare
SyncConfig.ps1 -Type "Schema" -SourceFile "\2020-12-10_09-25\Source-Schema.xml" -DestinationFile "\2020-12-10_09-25\Destination-Schema.xml"

#### Result
    Loading production file  C:\GitHub\develop\MIM\Microsoft-Solution\\2021-01-05_09-25\Source-Schema.xml .
    Loaded file  \2021-01-05_09-25\Source-Schema.xml . 1334  objects loaded.
    Loading pilot file  C:\GitHub\develop\MIM\Microsoft-Solution\\2021-01-05_09-25\Destination-Schema.xml .
    Loaded file  \2021-01-05_09-25\Destination-Schema.xml . 1307  objects loaded.

    Executing join between pilot and production.

    Executing compare between matched objects in pilot and production.
    Identified  29  changes to apply to production.
    Saving changes to  Changes-Schema.xml .

    Sync complete. The next step is to commit the changes using CommitChanges.ps1.


### Import
CommitChanges.ps1 -Type "Schema" -Uri "http://servername:5725"

#### Result
    Importing changes into production.
    Import complete.

### Import undone
CommitChanges.ps1 -Type "Schema" -undone -Uri "http://servername:5725"

#### Result
    Importing changes into production.
    Import complete.


## History
- Jan, 7, 2021 : Add a 'Undone' switch parameter
- Dec, 2, 2020 : Creation

## Credits

Mathias Dumont

## License

A short snippet describing the license (MIT, Apache, etc.)
