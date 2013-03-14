# typus_markitup

[typus_markitup](https://github.com/wollzelle/typus_fluxiom) is a module for [Typus](https://github.com/fesplugas/typus) to add the [markItUp! editor](http://markitup.jaysalvat.com/home/) to any textarea.

## Installation

Add this line to your application's Gemfile:

    gem 'typus_markitup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typus_markitup

## Configuration

## Usage

### In your model:

  class Post < ActiveRecord::Base
    typus_markitup :body
    ...

## Copyright

Copyright (c) 2013 Wollzelle GmbH. See LICENSE for details.