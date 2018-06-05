# Create a Chain of Trust

[Table of Contents](../../../README.md#table-of-contents) / [Create the Intermediate CA](README.md) / Create a Chain of Trust

---------------------------------------------------------------------------------------

> In order for the end user's browser to trust your certificate, it must be able to track your certificate from Server cert all the way to Root CA (which should be trusted on the machine).  Because of this, you need to provide a chain from one cert to the next when sending the cert across the wire, this is called a chain of trust.

1. cd into the CA directory:

       cd C:\Certificates\DoD\CA

2. Create the Chain of trust:

   Concantenate the certificate files together:

       type Intermediate\public\intermediate.cert.pem public\rootca.cert.pem > Intermediate\chain\root-intermediate-chain.pem

Next: [Create a Server Certificate](README_CreateServerCert.md)

---------------------------------------------------------------------------------------

[Table of Contents](../../../README.md#table-of-contents) / [Create the Intermediate CA](README.md) / Create a Chain of Trust