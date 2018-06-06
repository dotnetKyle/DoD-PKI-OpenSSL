# Mock DoD PKI for OpenSSL

This is a kit for cloning and then creating your own PKI system.

This will allow you to create the following certificate chains:

- DoD Root CA
  - DoD Intermediate CA
    - Server Certificates
  - DoD Signing CA
    - Client Certificates

This system has two intermediaries, a DoD Intermediate CA (for servers) and a DoD Signing CA (for users).  You can use the Root CA to make more intermediaries and you can use the intermediaries to create more client certificates for testing your software.

## Setup

>
  1. Clone the repository into a new folder at C:\Certificates

         git clone https://github.com/KBuroz/DoD-PKI-OpenSSL.git C:\Certificates

  2. Run PrepareDirectory.bat to create the files needed by OpenSSL:

         cd C:\Certificates
         PrepareDirectory.bat

  3. Install OpenSSL if it isn't already

  4. Finally, add OpenSSL to the PATH (system environment variables)

## Table of Contents

- [Create the DoD Root CA](DoD/CA/README.md)
  - [Import the Root CA onto Client](DoD/CA/README-Import-Root-Into-Trusted-Root-Certification-Authorities.md)
  - [Create the DoD Intermediate CA](DoD/CA/Intermediate/README.md)
    - [Create a chain of trust](DoD/CA/Intermediate/README-Create-Chain-Of-Trust.md)
    - [Create a localhost Server Certificate](DoD/CA/Intermediate/README-Create-Server-Cert.md)
  - [Create the DoD Signing CA](DoD/CA/Signing/README.md)
    - [Create a Client Certificate](DoD/CA/Signing/README-Create-Client-Cert.md)