Setup: 
  1. Copy the contents of the git repo into a folder at C:\Certificates
  2. Install OpenSSL
  3. Add OpenSSL to the PATH (system environment variables)

To Create the Root Key:
The root key is private (*.key.pem) and should be kept absolutely secure (usually on an air gapped machine).

Open a command window and CD into the Root CA folder at: C:\Certificates\DoD\1_RootCA

Use the following command to create the private key:

  openssl genrsa -aes256 -out private/rootca.pem.key

Follow the prompts to create a password for the private key.  Do not lose this password!  There is no password reset.

Use the following command to create the public certificate:

  openssl req -config rootca.cnf -key private/rootca.key.pem -new -x509 -days 7305 -sha256 -extensions v3_ca -out public/rootca.cert.pem

Enter the password for the private key you are using...
Press Enter on all the prompts to use the defaults 
(It's important you remember the settings you enter on the ROOT CA because they will have to match exactly the intermediate CAs)

You can verify the root ca by using the following command:

  openssl x509 -noout -text -in public/rootca.cert.pem

Since it is self-signed, it should have all the default values (or the values you entered in the Issuer and Subject).
    C = US
    ST = GA
    L = Fort Benning
    O = DoD
    O = USASOC
    OU = 75RR
    CN = MOCK DoD Root CA,
    emailAddress = MockS6@soc.mil

Key Usage is Digital Signature, Certificate Sign, CRL Sign

Next: Create the Intermediate Certificate