# Import the Certificate into IIS

[Table of Contents](../../../README.md#table-of-contents) / [Create the Intermediate CA](README.md) / [Create a localhost Server Certificate](README-Create-Server-Cert.md) / Import Into IIS

---------------------------------------------------------------------------------------

1. CD into Intermediate's public directory where the certificates are located:

       cd C:\Certificates\DoD\CA\Intermediate\public

2. Create the certificate chain:

   > In order for a browser to trust the localhost certificate, it needs to be able to fill in the gaps from the trusted certificate (`rootca.cer`) to the IIS certificate (`localhost.cer`).  This means that the localhost certificate needs to provide it's Issuer certificate in a certificate chain.  Because rootca.cer will be trusted on the client machine, rootca.cer does not need to be included in the certificate chain.

   Create the chain:

       type localhost.cer intermediate.cer > localhost-chain.cer

3. CD back to the intermediate directory:

       cd ..

4. Create the PFX file:

   > In order for you to import your certificates into a windows server (like IIS), you will need to create a PKCS #12 archive.

       openssl pkcs12 -export -in public/localhost-chain.cer -inkey private/localhost.key -out pfx/localhost.pfx

   Enter a secure export password.

5. Import the PFX into IIS:

   > In order to enable SSL in IIS, you need to import the localhost certificate into IIS.

   | Step | Figure |
   | --- | --- |
   | Open IIS | |
   | Click on the Server | ![Click on the Server](img/click-on-the-server.png) |
   | Double-Click on `Server Certificates`: | ![Server Certificates Button](img/server-certificates-button.png) |
   | Under `Actions`, Click `Import...` |  |
   | Browse to C:\Certificates\DoD\CA\Intermediate\pfx |  |
   | Select the localhost.pfx file: | ![localhost.pfx file](img/localhost-pfx-file.png) |
   | Enter the PFX export password |  |
   | Check `Allow this certificate to be exported` |  |
   | Click `OK` |  |
   | You should now see your certificate in the Server Certificates pane: | ![localhost certificate as seen in the server certificates pane](img/certificate-uploaded.png) |
   | In the IIS `Connections` pane, click on your website you want to add the certificate to. | |
   | In the IIS `Actions` pane, click on `Bindings...` |  |
   | `Add...` or `Edit...` the `https` binding |  |
   | Change the `SSL certificate:` drop-down to the correct localhost certificate that you just uploaded. |  |
   | Press `OK` |  |
   | Close the bindings window |  |

6. You can test the server and that the certificate chain verifies correctly using the following OpenSSL command:
   > Note: make sure you have trusted the rootca using mmc.exe.

   First CD into the root ca directory

       cd C:\Certificate\DoD\CA\public

   Run the command to connect to the server and verify the certificate:

       openssl s_client -connect locahost:443 -CAfile rootca.cer

7. Look carefully to verify the output from the command:

   First, you should see a `verify return 1` for each certificate in the chain:

       ...CN = DoD Root CA
       verify return 1
       ...CN = DoD Intermediate CA
       verify return 1
       ...CN = localhost
       verify return 1

   Next, you should see a printout of the certificate chain (each certificate's subject (s) and issuer (i):

       ---
       Certificate chain
       0 s: ...CN=localhost
         i: ...CN=DoD Intermediate CA
       1 s: ...CN=DoD Intermediate CA
         i: ...CN=DoD Root CA

   Lastly, look for:

       Verification: OK

8. Require PKI to access the website:

   | Step | Figure |
   | --- | --- |
   | In IIS, in the `Connections` pane... |  |
   | Click on the website: | ![Connections pane - Default Website](img/default-web-site.png) |
   | Double-click on `SSL Settings` | ![SSL Settings](img/ssl-settings.png) |
   | Check `Require SSL` and under `Client certificates:` select the `Require` radio button | ![Require SSL, Require Client Certificates](img/require-ssl.png) |

> The website should now prompt you for PKI each time you visit, just add your PKI you created under the [Signing tutorial](../Signing/README-Create-Client-Cert.md) to Google Chrome and select it when prompted.

---------------------------------------------------------------------------------------

[Table of Contents](../../../README.md#table-of-contents) / [Create the Intermediate CA](README.md) / [Create a localhost Server Certificate](README-Create-Server-Cert.md) / Import Into IIS