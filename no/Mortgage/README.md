# Open Broker for Mortgage Brokering in Norway
This specification defines events and content of these events for handling communication between a broker
and a provider on behalf of a cutomer that has a mortgage which they want to refinance.

## Versions of OpenBroker Specification for Mortgage
 - [v0](v0) - Status: *Active*

## Events
The following events are defined by the Open Broker specification

| Name                    | From      | To        | Description|
|-------------------------|-----------|-----------|------------|
| **Application Created** | Broker    | Provider  | Broker sends an application for refinancing a mortgage to the provider |
| **Rejection**           | Provider  | Broker    | Application was rejected by the provider |
| **Offering**             | Provider  | Broker    | Provider sends an offer |
| **Offer accepted**       | Broker    | Provider  | Customer has accepted the offer |
| **Offer rejected**       | Broker    | Provider  | Customer has rejected the offer |
| **Disbursed**           | Provider  | Broker    | The loan has been paid out the customer's bank account |
| **Message**             | Provider  | Broker    | A human readable message from the provider to the broker |

All events changes the state of the application, except for the _Message_ event which can be sent at anytime in the application process.
