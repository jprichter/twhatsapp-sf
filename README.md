# TwhatsApp Force

A whatsapp app built on twilio in salesforce

## Pre Reqs

* sfdx
* a scratch org
* a twilio account
* twilio [whatsApp sandbox](https://www.twilio.com/docs/autopilot/channels/whatsapp)

## Installation Instructions

1. Clone this repo
1. Create a scratch org 
1. Push this repo to your scratch org
1. Add the url for the twhatsapp site + service (https://URL_FOR_YOUR_SITE.com/services/apexrest/receive) as your webhook back in the [twilio console](https://www.twilio.com/console/sms/whatsapp/sandbox)
1. Update the Twilio Settings Custom Metadata Type Default Settings with
   * Account SID
   * Auth Token
   * twilio whatsapp number (From) e.g. whatsapp:+12223334444
   * your twilio sandbox participant number (To) e.g. whatsapp:+16667778888

## Warning

This is **not secure** and **should NOT** be used in a production environment. Use at your own risk.


