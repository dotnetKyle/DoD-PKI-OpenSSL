# Create a Client Certificate

[Table of Contents](../../../README.md#table-of-contents) / [Create the Signing CA](README.md) / Create a Client Certificate

-----------------------------------------------------------------------------------------------

1. cd into the SigningCA directory:

       cd C:/Certificates/Signing

2. Create a Client private key

       openssl genrsa -aes256 -out private/<username>.key.pem 2048

   > Note: Replace `<username>.key.pem` with something like `Smith.John.A.key.pem` that makes a valid windows filename.

   Enter a secure password

3. Create a certificate signing request.

       openssl req -config signingca.cnf -key private/<username>.key.pem -new -sha256 -out csr/<username>.csr.pem

   Enter the password you created for the private key

4. Keep using the signing CA to sign the client certificate request.

       openssl ca -config signingca.cnf -extensions usr_cert -days 365 -notext -md sha256 -in csr/<username>.csr.pem -out public/<username>.cert.pem

   Note: Be sure to use the Signing CA's password to sign the certificate request.

   Select `y` to sign the certificate

   Select `y` to commit the certificate

5. Verify the cert:

       openssl x509 -noout -text -in public/<username>.cert.pem

   The X509v3 Extended Key Usage should say `Client Authentication` & `Email Protection`

-----------------------------------------------------------------------------------------------

[Table of Contents](../../../README.md#table-of-contents) / [Create the Signing CA](README.md) / Create a Client Certificate