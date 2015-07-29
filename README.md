# typus_markitup

[typus_markitup](https://github.com/wollzelle/typus_markitup) is a module for [Typus](https://github.com/typus/typus) to add the [markItUp! editor](http://markitup.jaysalvat.com/home/) to any textarea.

## Installation

Add this line to your application's Gemfile:

    gem 'typus_markitup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typus_markitup

## Usage

### In your model:

    class Post < ActiveRecord::Base
      typus_markitup :body
      ...

## Copyright

Copyright (c) 2015 Wollzelle GmbH. See LICENSE for details.
