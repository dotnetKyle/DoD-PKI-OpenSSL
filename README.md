The Certificate Chain is as follows: 1 -> X -> *
Where 1 is the root ca, X is the intermediary, * is the end user

This system has two intermediaries, a DoD Intermediate CA (for servers) and a DoD Signing CA (for users).

DoD Root CA (1_RootCA)
  A. DoD Intermediate CA (1A_IntermediateCA)
     - Non Person Entities (A_Servers)
  B. DoD Signing CA (1B_SigningCA)
     - End Entities (B_Users)


