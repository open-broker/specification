# Open Broker Specification for Private Unsecured Loan Brokering in Norway
This specification defines events and content of these events for handling communication between a broker
and a service provider on behalf of a customer that has private loans which she wants to refinance.

## Versions of Open Broker Specification for Private Unsecured Loans
 - [v0](v0) - Status: *Under development*

## Events
The following events are defined by the Open Broker Specification

| Name                    | From      | To        | Description|
|-------------------------|-----------|-----------|------------|
| **Application Created** | Broker    | Provider  | Broker sends an application to the provider |
| **Rejection**           | Provider  | Broker    | Application was rejected by the provider |
| **Offering**            | Provider  | Broker    | Provider sends an offer |
| **Offer accepted**      | Broker    | Provider  | Customer has accepted the offer |
| **Offer rejected**      | Broker    | Provider  | Customer has rejected the offer |
| **Contract signed**     | Provider  | Broker    | Customer has signed the contract with the provider |
| **Disbursed**           | Provider  | Broker    | The loan has been paid out to the customer's bank account |
| **Message**             | Provider  | Broker    | A human-readable message from the provider to the broker |

All events changes the state of the application, except for the _Message_ event which can be sent at anytime in the application process.
