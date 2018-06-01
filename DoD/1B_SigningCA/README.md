# Create the DoD Signing CA

1. To create the Signing CA private key:

       openssl genrsa -aes256 -out private/signing.key.pem 4096

       Enter a strong password

2. Create a signing request for the root CA to sign your signingCA cert:

       openssl req -config signingca.cnf -new -sha256 -key private/signing.key.pem -out csr/signing.csr.pem

   Most of the options need to match the Root CA.

   Common Name, however MUST be different than the Root CA.

3. Now to create the signingCA public Key, you must sign it using the root CA.

   cd into the Root CA folder:

       cd ..
       cd 1_RootCA

4. Create the cert using the CSR:

       openssl ca -config rootca.cnf -extensions v3_intermediate_ca -days 365 -notext -md sha256 -in C:/Certificates/DoD/1B_SigningCA/csr/signing.csr.pem -out C:/Certificates/DoD/1B_SigningCA/public/signing.cert.pem

   Select 'y' to sign the certificate.

   Select 'y' to commit the certificate into the database.

   This will create the cert, and add the cert to the index, if its the first one it will throw a minor error and then create the index for you.

5. Verify the CERT:

   cd back into the signing directory:

       cd ..
       cd 1B_SigningCA

       openssl x509 -noout -text -in public/signing.cert.pem

Next: Create a localhost Server Certificate