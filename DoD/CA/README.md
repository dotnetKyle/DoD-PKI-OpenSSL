# Create the Root Certificate

[Table of Contents](../../README.md#table-of-contents) / Create the Root Certificate

------------------------------------------------------------------

The root key is private *(\*.key)* and should be kept absolutely secure (usually on an air gapped machine).

> Note: that paths to all the certificates must be correct (the repository should be cloned into C:\Certificates) otherwise you will have to re-path all the files used in this installation.

1. Open a command window and cd into the Root CA folder

       cd C:\Certificates\DoD\CA

2. Use the following command to create the private key:

       openssl genrsa -aes256 -out private/rootca.key

3. Follow the prompts to create a password for the private key.  Do not lose this password!  There is no password reset.

4. Use the following command to create the public certificate:

       openssl req -config rootca.cnf -key private/rootca.key -new -x509 -days 7305 -sha256 -extensions v3_ca -out public/rootca.cer

5. Enter the password for the private key you are using

6. Press `Enter` on all the prompts to use the defaults

   Note: Use something similar to `MOCK DoD Root CA` for the common name.

   *(It's important you remember the settings you enter on the `Root CA` because some of the `Intermediate CA` settings will have to match exactly)*

7. You can verify the root ca by using the following command:

       openssl x509 -noout -text -in public/rootca.cer

    Since it is self-signed, it should have all the default values (or the values you entered in the Issuer and Subject).

        C = US
        ST = GA
        L = Fort Benning
        O = DoD
        O = USASOC
        OU = 75RR
        CN = MOCK DoD Root CA,
        emailAddress = MockS6@soc.mil

    Key Usage is `Digital Signature`, `Certificate Sign`, and `CRL Sign`

Next: [Import the Root CA into the client](README-Import-Root-Into-Trusted-Root-Certification-Authorities.md)

------------------------------------------------------------------
[Table of Contents](../../README.md#table-of-contents) / Create the Root Certificate