---
layout: post
date: 2013-02-10
title: Smooth error handling for Meteor.methods
tags: [meteor]
category: programming
---

The same code can handle exceptions on the client and on the server, such as validation or access rights.

In shared area:

```coffeescript
throwError = (error, reason, details) ->
  error = new Meteor.Error error, reason, details
  if Meteor.isClient then error else throw error
  # return an Meteor.Error on client instead of throw
  # will prevent from error message in the console
```

Some method:

```coffeescript
Meteor.methods
  createPost: (text) ->
    unless @userId
      return throwError 403, 'Must be logged in'
    ...
```

Now on client side:

```coffeescript
Template.new_post.events
  'click input#create_post': (event, template) ->
    text = ($ event.target).prev('input').val()
    Meteor.call 'createPost', text, (error, result) ->
      if error
        new Message error.reason # it can be custom
          # reactive client collection for work with
          # client messages
```
