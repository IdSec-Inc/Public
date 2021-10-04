# List cipher config on the machine

This script lists cipher config and export it to a txt file.

## Project Goals

* Retrieve the cipher config.

## Prerequisites


## Using the script
### List ciphers
Get-ciphers

### Result
    SSL, TLS and Cipher Registry Values
    ***************************************


    Time                                     : 
    Customized Settings                      : False
    SSL Certificate Etypes Allowed           : {TLS_AES_256_GCM_SHA384, TLS_AES_128_GCM_SHA256, 
                                            TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, 
                                            TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, 
                                            TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, 
                                            TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, TLS_DHE_RSA_WITH_AES_256_GCM_SHA384, 
                                            TLS_DHE_RSA_WITH_AES_128_GCM_SHA256, 
                                            TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384, 
                                            TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, 
                                            TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384, 
                                            TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, 
                                            TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, 
                                            TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, 
                                            TLS_RSA_WITH_AES_256_GCM_SHA384, TLS_RSA_WITH_AES_128_GCM_SHA256, 
                                            TLS_RSA_WITH_AES_256_CBC_SHA256, TLS_RSA_WITH_AES_128_CBC_SHA256, 
                                            TLS_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA, 
                                            TLS_RSA_WITH_3DES_EDE_CBC_SHA, TLS_RSA_WITH_NULL_SHA256, 
                                            TLS_RSA_WITH_NULL_SHA, TLS_PSK_WITH_AES_256_GCM_SHA384, 
                                            TLS_PSK_WITH_AES_128_GCM_SHA256, TLS_PSK_WITH_AES_256_CBC_SHA384, 
                                            TLS_PSK_WITH_AES_128_CBC_SHA256, TLS_PSK_WITH_NULL_SHA384, 
                                            TLS_PSK_WITH_NULL_SHA256}
    SSL Certificate Signature Etypes Allowed : {RSA/SHA256, RSA/SHA384, RSA/SHA1, ECDSA/SHA256, ECDSA/SHA384, ECDSA/SHA1, 
                                            DSA/SHA1, RSA/SHA512, ECDSA/SHA512}
    SSL2 Client Setting                      : Enabled (default)
    SSL2 Server Setting                      : Enabled (default)
    SSL3 Client Setting                      : Enabled (default)
    SSL3 Server Setting                      : Enabled (default) - POODLE still possible
    TLS 1.0 Client Setting                   : Enabled (default)
    TLS 1.0 Server Setting                   : Enabled (default)
    TLS 1.1 Client Setting                   : Enabled (default)
    TLS 1.1 Server Setting                   : Enabled (default)
    TLS 1.2 Client Setting                   : Enabled (default)
    TLS 1.2 Server Setting                   : Enabled (default)
    FIPS Setting                             : Not Enabled (default)
    Cipher Setting: RC4 128/128              : Enabled (default)
    Cipher Setting: RC4 56/128               : Enabled (default)
    Cipher Setting: RC4 40/128               : Enabled (default)
    Secure Hash Algorithm (SHA-1) Use        : Enabled (default)
    MD5 Hash Algorithm Use                   : Enabled (default)
    RSA Key Exchange Use                     : Enabled (default)


## Contributing


## History

Feb 10, 2020 : Creation

## Credits

Mathias Dumont

## License

A short snippet describing the license (MIT, Apache, etc.)

## Donate
If you appreciate my work and you want to buy me a beer, send :
* Bitcoin to <b>bc1qj7592q9xqn2x6k06c2amglyaq0lyyntvvdwz297n9pmjszz4njcs85tkl2</b>
* Ethereum to <b>0x72B0be70715914F4D76e4d78a70F97854a6c4934</b>