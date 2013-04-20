---
layout: post
date: 2013-04-20
title: Rspec's let like behavior in Mocha
tags: [rspec, mocha, ruby, coffeescript]
category: programming
description: about hacks in mocha
---

The cleanest way to test method in [Rspec][rspec] is declare method
result in subject and pass different arguments from sub-contexts through
[let][rspec-let].

Some dummy ruby class:

```ruby
class Animal
  def initialize(kind)
    @kind = kind
  end

  def voice
    case @kind
    when :cow  then 'moo'
    when :cat  then 'meow'
    when :fish
      raise StandardError.new 'fish voice cant be heared'
    end
  end
end
```

Can be tested with various arguments without duplication:

```ruby
describe Animal do
  subject { Animal.new kind }

  context 'kind of cow' do
    let(:kind) { :cow }
    its(:voice) { should eq 'moo' }
  end

  context 'kind of cat' do
    let(:kind) { :cat }
    its(:voice) { should eq 'meow' }
  end

  context 'kind of fish' do
    let(:kind) { :fish }
    it 'voice cant be heared' do
      expect { subject.voice }
        .to raise_error 'fish voice cant be heared'
    end
  end
end
```

Test output:

```
Animal
  kind of cow
    voice
      should eq "moo"
  kind of cat
    voice
      should eq "meow"
  kind of fish
    voice cant be heared
```

What about such possibility in [Mocha][mocha]?

<!--more-->

Its possible.

Same dummy class in coffeescript:

```coffeescript
class Animal
  constructor: (@kind) ->
    voice: ->
      switch @kind
        when 'cow'  then 'moo'
        when 'cat'  then 'meow'
        when 'fish'
          throw new Error 'fish voice cant be heared'
```

NOTE: You have to be carefult with `-> / =>` and variables in nested contexts
and functions.

```coffeescript
describe 'Animal', ->
  beforeEach -> @animal = new Animal @kind

    context 'kind of cow', ->
      before -> @kind = 'cow'
      it 'voice should eq "moo"', ->
        @animal.voice().should.eq 'moo'

    context 'kind of cat', ->
      before -> @kind = 'cat'
      it 'voice should eq "meow"', ->
        @animal.voice().should.eq 'meow'

    context 'kind of fish', ->
      before -> @kind = 'fish'
      it 'voice cant be heared', ->
        (=> @animal.voice()).should.throw 'fish voice cant be heared'
```

It reproduces almost the same result:

```
Animal
  kind of cow
    ✓ voice should eq "moo"
  kind of cat
    ✓ voice should eq "meow"
  kind of fish
    ✓ voice cant be heared
```


[rspec]: https://www.relishapp.com/rspec
[rspec-let]: https://www.relishapp.com/rspec/rspec-core/v/2-13/docs/helper-methods/let-and-let
[mocha]: http://visionmedia.github.io/mocha/
