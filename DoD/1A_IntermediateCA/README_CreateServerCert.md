# Create a localhost Server Certificate

1. cd into the intermediate directory:

       cd C:/Certificates/1A_IntermediateCA

2. Generate the private key

       openssl genrsa -out private/localhost.key.pem 2048

   *Note: you omit the `-aes256` option to create a cert without a password for server certs. If you create a server cert with a password you will have to enter the password when the server restarts!*

3. Create a certificate signing request.

       openssl req -config intermediateca.cnf -key private/localhost.key.pem -new -sha256 -out csr/localhost.csr.pem

4. Now use the ***intermediate CA*** to sign the server certificate request.

       openssl ca -config intermediateca.cnf -extensions server_cert -days 375 -notext -md sha256 -in csr/localhost.csr.pem -out public/localhost.cert.pem

   Select `y` to sign the certificate

   Select `y` to commit the certificate

5. Verify the cert:

       openssl x509 -noout -text -in public/localhost.cert.pem

   The X509v3 Extended Key Usage should say `TLS Web Server Authentication`

Next: Create Client certificates