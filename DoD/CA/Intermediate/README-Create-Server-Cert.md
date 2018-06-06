# Create a localhost Server Certificate

[Table of Contents](../../../README.md#table-of-contents) / [Create the Intermediate CA](README.md) / Create a localhost Server Certificate

---------------------------------------------------------------------------------------

1. cd into the intermediate directory:

       cd C:/Certificates/Intermediate

2. Generate the private key

       openssl genrsa -out private/localhost.key 2048

   *Note: you omit the `-aes256` option to create a cert without a password for server certs. If you create a server cert with a password you will have to enter the password when the server restarts!*

3. Create a certificate signing request.

       openssl req -config intermediateca.cnf -key private/localhost.key -new -sha256 -out csr/localhost.csr.pem

4. Now use the ***intermediate CA*** to sign the server certificate request.

       openssl ca -config intermediateca.cnf -extensions server_cert -days 375 -notext -md sha256 -in csr/localhost.csr.pem -out public/localhost.cer

   > Note: that in `intermediateca.cnf`, in the extension `server_cert`, there is a section that defines the `X509v3 Subject Alternative Name` as `DNS:localhost, IP:127.0.0.1`.  If you want to use additional or different DNS/IP combinations, you need to modify this file before running the `openssl ca` command for the server certificate.  This section is required for a server cert to be trusted properly by a browser.

   Select `y` to sign the certificate

   Select `y` to commit the certificate

5. Verify the cert:

       openssl x509 -noout -text -in public/localhost.cer

   The `X509v3 Extended Key Usage` should say `TLS Web Server Authentication`

   The `X509v3 Subject Alternative Name` should say `DNS:localhost, IP Address:127.0.0.1` or whatever DNS/IP you chose in step 4.

6. Create the PFX file:

   > In order for you to import your certificates into a windows server (like IIS), you will need to create a PKCS #12 archive.

       openssl pkcs12 -export -in public/localhost.cer -inkey private/localhost.key -out pfx/localhost.pfx

---------------------------------------------------------------------------------------

[Table of Contents](../../../README.md#table-of-contents) / [Create the Intermediate CA](README.md) / Create a localhost Server Certificate