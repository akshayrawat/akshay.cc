---
title: On UI Prototyping
date: 2010-01-14 20:41 +05:30
---
Thorough UI Prototyping before development has become a mainstream practice in a lot of companies. Almost every company has their own style. Sometimes, that style may provide a direct competitive advantage. Prototypes also differ based on their purpose. Some use it for driving all kinds of analysis during design, some for building proof of concepts for gaining shareholder/VC acceptance and some even for ensuring that the development doesn’t go wrong, specially when the work is not co-located. Here are some things we learnt on a recent custom development job.

**Skip building high-fidelity prototypes** with tools like Photoshop, Fireworks etc. These kinds of prototypes take longer to build, incorporate unnecessary details and cannot be reused during the development. The tools provide unnecessary pixel drawing power and flexibility which only serve as a distraction to the team.

**Skip building low-fidelity prototypes** with paper, or tools like Balsamiq, OmniGraffle. These might be good for white-boarding or brainstorming sessions, but definitely cannot keep up when more detailed analysis, usability testing or actual behavior is required. It is hard to get creative when all you have are lines to draw wireframes. Again, these cannot be reused during the development.

For prototyping, **use a whiteboard** for high level features. For anything more, use **lightweight HTML/CSS frameworks** like HAML, SASS, Blueprint which make composing HTML pages much faster and simpler. Its fast and straightforward to get into the ‘tweak &amp; refresh’ cycle. Since more developers are familiar with HTML, than with tools like Photoshop, it makes collaboration much easier. Also, parts of the code can be used to guide development and as [big visible charts](http://xprogramming.com/articles/bigvisiblecharts/).

Since the prototype is all plain code, **version controlling** your prototypes with Git or Mercurial is a must - this makes branching and merging easier.  Unknown elements can be ‘spiked’ in their own branch, to be merged or discarded later, based on feedback. This also makes cross pollination of features across multiple prototypes(branches) much easier.

**Build multiple versions, in time-boxed runs**. This is a common mistake made by many teams. If you are starting on a fresh application, make sure to try at least 2 to 3 prototypes with different ideas, in fixed periods of time. Once you have settled for one, you have laid down the foundations for features like top level navigation, page structures, data presentation, page work flows, basic color &amp; typography schemes etc.

**Avoid Big Upfront Prototyping**. In our case prototypes were just enough to tell us about the work 2-3 weeks in advance. Our development iteration cycle was a couple of weeks behind the prototype.

Prototypes are a good starting point for **Domain Driven Design sessions**. We used it to build a common vocabulary/language across the team - developers, analysts and the users. These were words &amp; concepts around - ‘kinds of users’ (e.g. Content Creators, Admins, Designers, End Users), domain terms(e.g. Staging Period, End Of Life), names given to pages, views of data on pages (business card view of a person), etc.

**Use design metaphors from other popular sites or design books** (my favorite being Designing Interfaces) to explain complex concepts or UI patterns like Digg style voting system or Facebook like feeds. Also the YUI pattern library provided a lot of language around UI elements.

**Don’t prototype what you know**. Good examples are login pages, validates failures, filters, searches, cancel buttons. Stub out as many links as you can or any other behavior which is well understood. Don’t Repeat Yourself - talk and explain a concept instead of prototyping if it is close to something already prototyped.

**It is ok for the prototype to be out of sync**. A prototype type needs to be forward compatible not backward. We tried to follow this as much as possible.

**Build a screencast with audio** once your are done, explaining the concepts and the workings of the prototype. This will be enough for 80% of the audience.

**Use your judgement to kill the prototype**.  There is an obvious cost to prototyping, make sure the prototype is giving you enough bang for the buck, at all times.

**Finally, use prototypes as guidelines**, not as rules during implementation. A lot of dynamics are exposed during actual implementation, use this as feedback in the prototype. We specially saw this come true during development. We realized that our implementation differed from our prototypes by nearly 30% - 40% in the end.
