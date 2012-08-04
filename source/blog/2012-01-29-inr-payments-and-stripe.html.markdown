---
title: INR Payment using Stripe
date: 2012-01-29 20:41 +05:30
---
The question
Stripe + Open Source Currency Rate Exchange API = Accept Payments in INR without a merchant account, if you have a US bank account and are fine with coming in USD. How well does it work ?

The answer
A work in progress, so don't make any decisions based on this work.

Notes
Stripe is a good starting point for small ideas which want to accept payments overnight, and deal with the formalities later.

Technically, its quite simple. I wrote up a simple rails app to demo this here. It accepts an amount in INR, converts it to USD  and posts it to a production Stripe environment(my bank account). The amount on customer's the bank statement is extremely close to the equivalent USD amount posted, i.e. if an item is for INR 1000, the customer might see a amount like INR 1001, due to currency conversion rounding. The Stripe fee is 2.9%+ 30 cent. I think this is a non issue for early stage ideas.

However, all debit, credit cards may not work, and I want the explore the reasons behind that. Stripe is actually a credit card processor, but my vanilla ICICI debit card worked perfectly. In the coming days, I'll make a list of all the cards I've tested, while refining certain things which could increase the success rate. If you want to try out a card, get in touch with me and we'll test it out.

Cash on Delivery is a nice and easy fallback option which is offered by courier companies like BlueDart and Aramex.

Working:
ICICI Visa Debit card
ICICI MasterCard Credit card
Not working

HDFC Visa Debit card
