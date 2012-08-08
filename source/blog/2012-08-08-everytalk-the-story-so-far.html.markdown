---
title: EveryTalk - The Story so far
date: 2012-08-08 23:27 +05:30
---
I'm a big fan of watching tech videos, having learnt a lot from services like [Railscasts](http://railscasts.com/), [Peepcode](https://peepcode.com/), [DestroyAllSoftware](https://www.destroyallsoftware.com/screencasts). Since I'm currently based in Bangalore, it gets very hard for me to attend conferences and keep track of session videos as they come out. So last month, I wrote [EveryTalk.tv](http://www.everytalk.tv/), in a night filled with madness - got a cheap domain, no tests, twitter bootstrapped on a free Heroku account. I must admit most of my night ideas, seem very bad in the morning. The MVP based based on my needs was up in no time, it just solves my itch.

It's really simple

* A simple listing of talks by conference.
* A basic playlist feature.
* A search which looks at the talk title, description and the speaker.
* Scripts to import conference data from various sources.

This worked perfectly for me until the system crossed a 100 videos (closing in on a 1000 today) and then I would just spend time browsing, looking for interesting stuff. My playlist would grow much faster than I could watch, and sometimes I would just forget to watch, even when I wanted to make this a habit. Obviously, I hadn't given it much thought, and that is where [EveryTalk.tv](http://www.everytalk.tv/) is today. To summarize, there are 2 problems: _discovery_ and _consumption_. I might work on them if the website gets any traction, its an experiment/hobby which is not looking to monetized at the moment (open source?).

Here is how I _plan_ to address these problems:

#### Discovery:

* Follow speakers. This is the biggest way I discover new content. When a speaker who you follow has a new video, it gets added to your playlist.
* Topic focussed channels. Say, a channel for MongoDB, a channel for HTML5 games. My inspiration for this is Mac App Store type collections - like Apps for Colleges, Games starter kit. Its hard to categorize all talks, but easy to build a collection of a few selected talks that are in your area of interest. New content in a channel gets added to your playlist.
* Rank and feature talks based the number of playlists they are in. Popularity, sort of.
* View other people's playlists.

#### Consumption:
* Scheduled playlist notifications: You can opt to receive links to one or more talks from your playlist in a schedule determined by you.

This is limited, but in my opinion enough and doable in the short term.

In the meanwhile, if you think this idea might help you learn, tell me what you think, leave some comments.
