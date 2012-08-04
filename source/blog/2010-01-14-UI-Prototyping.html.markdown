---
title: UI Prototyping
date: 2010-01-14 20:41 +05:30
---
Post Redirects to Get is a common pattern seen in most web applications. If a POST changes the server state, eg. by storing a value in the database then it should redirect to a GET so that when a user refreshes the page, the browser doesn't POST the data again. All good until now, but what happens when a POST does not change the server state and this is interesting when it comes to bookmarking such pages.

Here is how in Rails a simple scaffolded User controller looks like:

users_controller.rb
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml =&gt; @user }
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml =&gt; @user, :status =&gt; :created, :location =&gt; @user }
      else
        format.html { render :action =&gt; "new" }
        format.xml  { render :xml =&gt; @user.errors, :status =&gt; :unprocessable_entity }
      end
    end
  end


The two actions 'create' and 'new' are of interest to us here.
Now imagine this:

1&gt; User is on the New User page at '/users/new'
2&gt; Submits the form with invalid data
3&gt; The form is re-rendered with errors, the url has changed to '/users/.

Here we are in a state where we are on a URL which cannot be bookmarked to get us to the same page. Now, what is the correct solution here. We could
&gt; We could redirect to 'new', but then we would lose all validation errors, or
&gt; Store the full error messages in flash and redirect to 'new', or
&gt; Store the invalid object in flash, and then retrieve it in the 'new' action to show the errors.

This decision really comes down to how important bookmarking of pages is in your application.  All three options introduce unnecessary code kludge - and are probably not worth it, ie. I would prefer breaking bookmarking in some scenarios in the app.
For me, this is really a 'good to know' for post production error diagnosis, when you look at exception logs which show GETs on URLs which expect only POSTS. I've seen this done not only by browsers but also by search bots.
