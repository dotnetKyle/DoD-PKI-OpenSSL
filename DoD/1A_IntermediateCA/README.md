To create the Intermediate CA private key:

    openssl genrsa -aes256 -out private/intermediate.key.pem 4096

    Enter a strong password

Create a signing request for the root CA to sign your intermediate cert:

    openssl req -config intermediateca.cnf -new -sha256 -key private/intermediate.key.pem -out csr/intermediate.csr.pem

    Most of the options need to match the Root CA.

    Common Name, however MUST be different than the Root CA.

Now to create the Intermediate CA public Key, you must sign it using the root CA.

cd into the Root CA folder:

    cd ..
    cd 1_RootCA

Create the cert using the CSR:
    openssl ca -config rootca.cnf -extensions v3_intermediate_ca -days 365 -notext -md sha256 -in C:/Certificates/DoD/1A_IntermediateCA/csr/intermediate.csr.pem -out C:/Certificates/DoD/1A_IntermediateCA/public/intermediate.cert.pem

Select Y to sign the certificate.

Select Y to commit the certificate into the database.

This will create the cert, and add the cert to the index, if its the first one it will throw a minor error and then create the index for you.

Verify the CERT:

cd back into the signing directory:
    cd ..
    cd 1A_IntermediateCA

    openssl x509 -noout -text -in public/intermediate.cert.pem