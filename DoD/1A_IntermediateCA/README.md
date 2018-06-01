# Create the Intermediate CA

[Table of Contents](../../README.md) / Create the Intermediate CA

-----------------------------------------------------------------

1. Create the Intermediate private key

       openssl genrsa -aes256 -out private/intermediate.key.pem 4096

    Enter a strong password.

2. Create a signing request for the root CA to sign and issue your intermediate cert:

       openssl req -config intermediateca.cnf -new -sha256 -key private/intermediate.key.pem -out csr/intermediate.csr.pem

    Most of the options need to match the Root CA.

    `Common Name`, however must be different than the Root CA.  Use `DoD Intermediate CA` for `Common Name`.

3. Now to create the Intermediate CA public Key, you must sign it using the root CA.

   * cd into the Root CA folder:

         cd ..
         cd 1_RootCA

   * Create the cert using the CSR:

         openssl ca -config rootca.cnf -extensions v3_intermediate_ca -days 730 -notext -md sha256 -in C:/Certificates/DoD/1A_IntermediateCA/csr/intermediate.csr.pem -out C:/Certificates/DoD/1A_IntermediateCA/public/intermediate.cert.pem

Select `y` to sign the certificate.

Select `y` to commit the certificate into the database.

This will create the cert, and add the cert to the index, if its the first cert it will throw a minor error while adding it to the index and then create the index for you.

Verify the CERT:

cd back into the signing directory:

    cd ..
    cd 1A_IntermediateCA

    openssl x509 -noout -text -in public/intermediate.cert.pem

Next: [Create a Server Certificate](README_CreateServerCert.md)

-----------------------------------------------------------------

[Table of Contents](../../README.md) / Create the Intermediate CA