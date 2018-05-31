cd into the intermediate directory:

cd C:/Certificates/1A_IntermediateCA

openssl genrsa -out private/localhost.key.pem 2048

(Note: you omit the -aes256 option to create a cert without a password for server certs)

Create a certificate signing request.

openssl req -config intermediateca.cnf -key private/localhost.key.pem -new -sha256 -out csr/localhost.csr.pem

Now use the intermediate CA to sign the server certificate request.

openssl ca -config intermediateca.cnf -extensions server_cert -days 375 -notext -md sha256 -in csr/localhost.csr.pem -out public/localhost.cert.pem

Select Y to sign the certificate

Select Y to commit the certificate

Verify the cert:

openssl x509 -noout -text -in public/localhost.cert.pem

The X509v3 Extended Key Usage should say TLS Web Server Authentication

TODO: Use the chain file created earlier to verify that the cert has a valid chain of trust.