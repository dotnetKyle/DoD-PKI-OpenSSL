Create a client cert

cd into the SigningCA directory:

cd C:/Certificates/1B_SigningCA

openssl genrsa -aes256 -out private/username.key.pem 2048

Enter a secure password

Create a certificate signing request.

openssl req -config signingca.cnf -key private/username.key.pem -new -sha256 -out csr/username.csr.pem

Enter the password for the -key

Now use the signing CA to sign the client certificate request.

openssl ca -config signingca.cnf -extensions usr_cert -days 375 -notext -md sha256 -in csr/username.csr.pem -out public/username.cert.pem

Select Y to sign the certificate

Select Y to commit the certificate

Verify the cert:

openssl x509 -noout -text -in public/username.cert.pem

The X509v3 Extended Key Usage should say TLS Web Server Authentication

TODO: Use the chain file created earlier to verify that the cert has a valid chain of trust.