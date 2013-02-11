---
layout: post
date: 2013-01-28
title: Ajax' like autocomplete for Meteor & Bootstrap
tags: [meteor, bootstrap]
category: programming
---

Straightforward solution for populate [Twitter Bootstrap typeahead][ref1] source data in [Meteor][ref2].

On client side:

```coffeescript
Template.items.rendered = ->
  $("input#item").typeahead
    source: (query, process) ->
      subscription = Meteor.subscribe "autocompleteItems", query, ->
        process _(Items.find().fetch()).pluck("name")
      subscription.stop() # here may be a bit different logic,
      # such as keeping all opened subsriptions until autocomplete
      # will be successfully completed and so on
    items: 5
```

On server side:

```coffeescript
Meteor.publish "autocompleteItems", (query) ->
  Items.find
    name: new RegExp(query, "i"),
      fields: { name: 1 },
      limit: 5
```

[ref1]: http://twitter.github.com/bootstrap/javascript.html#typeahead
[ref2]: http://meteor.com/