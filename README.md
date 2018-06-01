# Mock DoD PKI for OpenSSL

This is a kit for cloning and then creating your own PKI system.

This will allow you to create the following certificate chains:

- DoD Root CA
  - DoD Intermediate CA
    - Server Certificates
  - DoD Signing CA
    - Client Certificates

This system has two intermediaries, a DoD Intermediate CA (for servers) and a DoD Signing CA (for users).  You can use the Root CA to make more intermediaries and you can use the intermediaries to create more client certificates for testing your software.

## Table of Contents

- [Create the DoD Root CA](DoD/1_RootCA/README.md)
  - [Create the DoD Intermediate CA](DoD/1A_IntermediateCA/README.md)
    - [Create a localhost Server Certificate](DoD/1A_IntermediateCA/README_CreateServerCert.md)
  - [Create the DoD Signing CA](DoD/1B_SigningCA/README.md)
    - [Create a Client Certificate](DoD/1B_SigningCA/README_CreateClientCert.md)

## Setup

>
  1. Clone the repository into a new folder at C:\Certificates

         git clone https://github.com/KBuroz/DoD-PKI-OpenSSL.git C:\Certificates

  2. Install OpenSSL
  3. Add OpenSSL to the PATH (system environment variables)