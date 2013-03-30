---
title: Debugging Ember.js and Ember Data
date: 2013-02-22 17:02 +05:30
tags:
---

####Debugging EmberJS and Ember Data:

Things I found useful while debugging problems. They are current as of Ember.js 1.0.0.rc1.

* Log router transitions:

```javascript
  window.App = Ember.Application.create({
    LOG_TRANSITIONS: true,
  });
```

* Log object bindings:

```javascript
  Ember.LOG_BINDINGS = true
```

* View all registered routes:

```javascript
  Ember.keys(App.Router.router.recognizer.names)
```

* View all registered templates:

```javascript
  Ember.keys(Ember.TEMPLATES)
```

* Get the state history of an ember-data record:

```javascript
  record.stateManager.get('currentPath')
```

* Get the View object for a generated ember `div` by its div id.

```javascript
  Ember.View.views['ember605']
```

* Log state transitions:

```javascript
  record.set("stateManager.enableLogging", true)
```

* View an instance of something from the container:

```javascript
  App.__container__.lookup("controller:posts")
  App.__container__.lookup("route:application")
```

* View ember-data's identity map:

```javascript
  App.__container__.lookup('store:main').recordCache # all records in memory
  App.__container__.lookup('store:main').recordCache[2].get('data.attributes') #attributes
  App.__container__.lookup('store:main').recordCache[2].get('comments') #loaded associations
```

* See all observers for a object, key:

```javascript
  Ember.observersFor(comments, keyName);
```

* Dealing with deprecations:

```javascript
Ember.ENV.RAISE_ON_DEPRECATION = true
Ember.LOG_STACKTRACE_ON_DEPRECATION = true
```
  
* Handlebars:

```javascript
  {{debugger}}
  {{log record}}
```

* Implement a `Ember.onerror` hook to log all errors in production:

```javascript
  Ember.onerror = function(error) {
    Em.$.ajax('/error-notification', 'POST', {
      stack: error.stack,
      otherInformation: 'exception message'
    });
  }
```

* Use ember extension when its ready:
        
        https://github.com/tildeio/ember-extension.git