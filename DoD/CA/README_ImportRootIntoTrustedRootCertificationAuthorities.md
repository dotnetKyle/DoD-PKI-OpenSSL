# Import the Root CA onto Client

[Table of Contents](../../../README.md#table-of-contents) / [Create the Root CA](README.md) / Import the Root CA onto Client

---------------------------------------------------------------------------------------

1. From anywhere in the console type:

       mmc.exe

   A Microsoft Management Console instance will start after you give it Administrator permissions.

2. Add the `Certificates` Snap-In

   * Go to `File` > `Add/Remove Snap-in...`
   * Select `Certificates`
   * Click `Add >`
   * Select `Computer Account`
   * Click `Next >`
   * Select `Local computer`
   * Click `Finish >`
   * Click `OK`

   > Note: you should now see the `Certificates` Snap-in under the `Console Root` on the left side of the window

3. Import the Root CA into `Trusted Root Certification Authorities`

   * Expand the `Certificates` node under the `Console Root` node
   * Expand the `Trusted Root Certification Authorities` node under the `Certificates` node
   * Click on the `Certificates` node under the `Trusted Root Certification Authorities` node
     > Note: you should now see all of the trusted root CAs on your computer
   * Right-click on the `Certificates` node under the `Trusted Root Certification Authorities` node
   * Under `All Tasks` select `Import...`
   * You should see the `Certificate Import Wizard`, click `Next >`
   * Click `Browse...` and select your .pem file you created under the CA folder. (C:\Certificates\CA\public\rootca.cert.pem)
     > Note: you will need to change the File Type on the dialog to `All Files (\*.\*)` to select a .pem file type
   * Click `Next >`
   * Select `Place all certificates in the following store` and make sure `Trusted Root Certification Authorities` is selected
   * Click `Next >`
   * Make sure everything is correct and select `Finish`
     > Note: you should get a dialog telling you that the import was successful.

> You are now ready to begin using certificates that are in this chain of trust.

Next: [Create the Intermediate Certificate for signing Server Certificates](Intermediate/README.md)

or

Next: [Create the Signing Certificate for signing Client Certificates](Signing/README.md)

---------------------------------------------------------------------------------------

[Table of Contents](../../../README.md#table-of-contents) / [Create the Root CA](README.md) / Import the Root CA onto Client