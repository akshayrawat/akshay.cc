---
title: Theming with SASS
date: 2010-08-09 20:41 +05:30
---
Does your application need to support multiple themes? SASS enables a neat technique to implement multiple themes in the same application. Here are some guidelines on how to go about it.

Lets say we have an application which needs to support multiple clients each with its own custom branding eg. logo, colors, images, typography etc. Hence, each client comes with its own set of theming requirements. Here are some guidelines on how to go about it.

Decide on what will determine which theme to display. 
If the same deployment serves multiple clients each on their own domains/subdomains, then a decision to select the right client can be made by looking at the http headers. If each client is deployed independently then perhaps a configuration can decide which client to use.

Structuring SASS files.
Once the client is determined, we know now which theme to use. First its important to structure your stylings correctly. I usually recommend to extract colors, typography, image urls into sass variables in their own SASS partials. Usually, you'll know what will change across clients and most of them could be good candidates for extraction into their own SASS partials.

Now start with a baseline theme. All the client themes provide specific overrides to this. When using Rails, here is how to structure the SASS folders
public/stylesheets/sass/baseline.sass
public/stylesheets/sass/_colors.sass
public/stylesheets/sass/_typography.sass
public/stylesheets/sass/_images.sass
public/stylesheets/sass/_page_layouts.sass

The baseline.sass imports the baseline partials. It also defines/imports all generic stylings like page layouts etc.
baseline.sass
@import colors
@import typography
@import images
@import page_layouts

Then to define a theme for 'client_a'
public/stylesheets/sass/client_a.sass
public/stylesheets/sass/client_a/_colors.sass
public/stylesheets/sass/client_a/_typography.sass
public/stylesheets/sass/client_a/_images.sass
public/stylesheets/sass/client_a/_page_layouts.sass

and client_a.sass imports all partials in the client_a folder
client_a.sass
@import client_a/colors
@import client_a/typography
@import client_a/images
@import client_a/_page_layouts.sass

A baseline with client specific overrides
We use Ruby style instance variable caching to initialize the baseline sass variables.
public/stylesheets/sass/_colors.sass
!body_background ||= #0b274e
!content_background ||= #222222
!text ||= #FFFFFF

Correspondingly, all client specifies values are initialized.
public/stylesheets/sass/client_a/_colors.sass
!body_background = #0b274e
!content_background = #444444

Then to tie this all together, just include the right client sass based on the client selection earlier. eg For client_a - include client_a.sass. client_a.sass will look like this now -
client_a.sass
@import client_a/colors
@import client_a/typography
@import client_a/images
@import baseline.sass
@import client_a/_page_layouts.sass

All SASS variable defined by client partials will be initialized first and then the uninitialized ones will be defaulted by baseline.sass. Then all client specific css rules(in client_a/layouts.sass) override the default ones defined by baseline.sass. The key here is to include all client specific partials with SASS variables before baseline.sass and all client specific partials with css rules after baseline.sass.

Other things which help
&gt; All common images like buttons, icons etc should have a transparent background so that they can be themed with a background color.
&gt; All images follow a standard size across multiple themes. This will prevent layouts from breaking.
&gt; The SASS variables in their partials(colors, fonts, images) each represent a legend. For ex, _color.sass is the color legend. So name your variables carefully. Ideally a designer should be able look at it at tweak colors automagically.
&gt; Make sure you use the exact same css selector to override a baseline styling. For example, for
&lt;div class="home"&gt;
&lt;a class="home-link" href="#"&gt;Home&lt;/a&gt;
&lt;/div&gt;

baseline.sass
.home a
color: red
then override using

client_a.sass
.home a
color: black
and not
client_a.sass
.home-link
color: black


And thats it. Hope it helps !
