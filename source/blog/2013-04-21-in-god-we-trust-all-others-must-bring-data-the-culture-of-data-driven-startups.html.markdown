---
title: In God we trust; all others must bring data –  The culture of Data driven startups
date: 2013-04-21 21:10 +05:30
tags:
---

Startups are all about focus, learning and improving the business's bottom line based on that. Hence it is very important to have an explicit technique on how to go about doing that. That is where popular memes like `data driven startups`, `lean startup movement` help. 

In such teams, everyone is aware about how their work effects metrics. In fact, each person or role has very specific metrics associated with their job. Their work plans, actions are based around those metrics, not intuition, beliefs or assumptions. Their work performance is directly associated with those metrics.

Metrics can usually be classified into 3 kinds, based on their intentions, detail and audience. Its really important to classify them – as you may want to think about them differently based on that.

#### Metrics which gauge business health

These measure the overall health of a company. It should be available to everyone in the company. It must provide time framed as well as cumulative numbers. This must be presented in a summarized manner to be read quickly. Example [Operating metric](http://en.wikipedia.org/wiki/Performance_metric) dashboard.

Usually most businesses have a funnel like `Page Visits => Signups => Engage => Transaction`. Then there is product engagement and churn. You want to report a key number from every aspect which drives revenue to the business.

You may also want to build an equation comprising of various parts of the system . Example, Given X visits from blog, Y users register. Given Y registered users, Z make a transaction. If you are able to break your business into an equation like that, you'll not only be able to identify the key bottlenecks in your business, but also predict growth in a quantifiable manner.

Your `Operational Report` dashboard should at least have the following:

* Page views per time interval
* Signups per time interval
* Product engagement: Session length, Transactions.
* Churn.
* Company growth: Sign - Churn rate.

All the other metrics in the system exist to support the Operational metrics mentioned above. Think of it like a tree of nodes, where root of a tree is an operation metric and the leaf nodes are the various other metrics supporting the root metric. Also its very important to tie back all operational metrics to a single metric - this could be something like `Daily Revenue`. Whatever your technique, its very important to hang it somewhere as a big visible chart.

#### Metrics which drive product development

All features/optimizations start out by making an assumption, and their lifetime is not set in stone. To illustrate this, a feature development workflow might look like this:

1. Set a metric goal which you want to achieve in a set timeframe. This is ofcourse closely associated with an operational metric.
2. Make an assumption on how to meet that goal. This is the feature you want to develop.
3. Think about a data collection strategy for the metric.
4. Execute the assumption.
5. Build a reporting model which translates the data collected to a form which answers the initial assumption.
6. If the assumption meets the goal, you keep it, or else you drop the implementation and go back to step 2.

Hence metrics act as a tight feedback loop to determine what works, what doesn't and with what efficiency. Every iteration cycle answers an assumption which provides quantifiable data on the direction to iterate, pivot. Hence your decisions are based on numbers and not on intuition, philosophy, or the competition. Also, the idea is to fail fast, early and often and hence learn more from that. 

Also, sometimes big, basic messaging is enough to gauge an interest in a feature, a lot of products don't do that enough.


#### Metrics to measure churns

A lot has been said about cohort analysis. I recommend reading [this](http://jonathonbalogh.com/2012/03/24/introduction-to-cohort-analysis-for-startups/).

To reduce churn, its important to measure product engagement as users age in the system. So creating cohorts of users based on their system age is important. Then you should be able to determine things like

* How people in various cohorts interact with the different features of your product.
* Prioritize feature development for specific cohorts and measure their effectiveness in that cohort.

Periodic NPS surverys are also useful. Recommend reading [this](http://www.surveymonkey.com/mp/net-promoter-score/) & [this](http://blog.surveymonkey.com/blog/2013/04/10/qualitative-vs-quantitative/).


Usually you'll find pockets of users with extreme feedback, or other outliers in some sense. In those cases, follow quantitative measurements with qualitative ones - like a one on one conversation.  If you get one kind of feedback from a user, make sure to validate it across multiple groups of users. Or ask them if they would actually pay more for such a feature. Do not assume anything.

In short: _Its not about how much and what you measure, but about how quickly you can learn from what you measure._

#### References

* [Basics of Double loop learning](http://www.afs.org/blog/icl/?p=2653) & [the Lean startup movement](http://en.wikipedia.org/wiki/Lean_Startup)
* [Startup Metrics presentation](http://www.slideshare.net/dmc500hats/startup-metrics-for-pirates-seedcamp-sept-2009?from=ss_embed) by Dave McClure
* [Data driven businesses](http://www.everytalk.tv/talks/2396-Business-of-Software-Data-Driven-Businesses) by Dave Cancel