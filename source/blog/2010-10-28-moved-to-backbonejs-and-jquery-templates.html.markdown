---
title: Moved to BackboneJS and JQuery templates
date: 2010-10-28 20:41 +05:30
---
I had been planning to move [DirectoryOfMinisters](http://directory.myminister.info/) to Javascript for sometime now. It is a simple directory to find information on Members of Parliament from various states in India. It was based on a Sinatra backend which consumed data served by an API with Haml,Sass for view goodness.
The options I evaluated were SproutCore, Cappuccino and Backbonejs. I did think too much about JQuery Data bindings, because I wanted to explore an MVC solution to building a frontend, albeit a simple one. I finally went with Backbonejs because it was the lightest thing I could use and the fastest to implement (for me). The only features which I really wanted were - JSON backed models, Javascript templating, the ability to listen to events for model modifications and a basic structure to organizing JS code.
To get an idea of how simple this application is, visit `http://directory.myminister.info`. Here is a brief on how the code looks.

The main page of the app is `index.html`, it just loads all the JS files in app.

```html
index.html
<script src="/js/mpprofile.js"></script>
<script src="/js/mps.js"></script>
<script src="/js/states.js"></script>
<script src="/js/init.js"></script>
```

Each javascript file here represents a view. `init.js` starts up the app by initializing the first view.

```javascript
init.js
$(document).ready(function(){
  new StateView();
});
```

Now when a `StatesView` is initialized, it creates a new `States` collection. The States initializer knows how to get the data to initialize the State model.

```javascript
states.js
var StateView = Backbone.View.extend({
  id: 'states',

  events: {
    "click #states table tr[id]": "stateSelected"
  },

  initialize: function(){
    this.states = new States();
    this.states.bind('refresh', this.refresh);
  }
}
```

```javascript
states.js
var States  = Backbone.Collection.extend({
  model: State,
  initialize: function(){
    var that = this;
    $.ajax({
      url : Config.api_host + '/states.json',
      dataType : "jsonp",
      success : function (data, status, xhr) {
      that.refresh($.parseJSON(data.model));
    }
  }
});

```

In this case we make a jsonp request to get data from a different subdomain. The view listens to the `refresh` event on the collection. `refresh` is used to initialize the collection with the model json. After `refresh` happens, we get the JQuery template for the view and bind the data to it.

```javascript
states.js
render: function() {
  var that = this;
  $.get('/html/_states.tpl.html', function(statesTemplate) {
    this.$(this.el).html($.tmpl(statesTemplate, {stateList: this.states.models}););
    $("#col-1").html(this.el);
  });
  return this;
}
```

And we have our first page. Now, when a state is selected, the handler `stateSelectedbound` to the state row creates a new `MPView`.

```javascript
states.js
stateSelected: function(event){
  new MPView({stateId: event.currentTarget.id});
}
```

The `MPView` initialization again initializes the Collection first, which knows which url to get the data from. In this case we get all the ministers for the state id.
The full source code for this app is here. I'm still in the process of improving it as I get more fimilar with Backbonejs. 

Having said that, there are 2 things I wish BackboneJS would do better.

Usually a Collection can define its source url like this

```javascript
var Notes = Backbone.Collection.extend({
  url: '/notes'
});
```

This is very nice indeed, except that it doesn't work when the datatype is `jsonp`. Then one has to drop down to jquery to make a jsonp ajax call to get the data.
A view can listen to events on UI elements like this

```javascript
var DocumentRow = Backbone.View.extend({
  tagName: "li",
  className: "document-row",
  events: {
    "click .button.edit":   "openEditDialog"
  }
}
```

Nice again. Here this is bound to the view. This is very handy indeed unless you want to know which element was clicked. In which case I had to resort to using JQuery's click , which sets the this to the clicked element.
Some examples on unit testing BackboneJS MVC would also be nice.
Now back to exploring some server side js !

**Update:** The code kludge with binding events (complaint no. 2) is gone based on this comment from Jeremy Ashkenas. The example above is corrected.

