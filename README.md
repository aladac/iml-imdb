[![Gem Version](https://img.shields.io/gem/v/iml.svg)](https://rubygems.org/gems/iml)
[![build status](https://travis-ci.org/aladac/iml.svg?branch=master)](https://travis-ci.org/aladac/iml)
[![Maintainability](https://api.codeclimate.com/v1/badges/232800c6e4d8778937b2/maintainability)](https://codeclimate.com/github/aladac/iml/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/232800c6e4d8778937b2/test_coverage)](https://codeclimate.com/github/aladac/iml/test_coverage)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](https://www.rubydoc.info/github/aladac/iml/master)

[![IML](https://github.com/aladac/iml/raw/master/doc/iml-logo.png)](https://rubygems.org/gems/iml)

*Intricate (Media) Matching Logic IMDB Extension*  

This is an exstension to the `iml` gem. It allows simple IMDB query/search operations.

## Installation

This gem requires ruby >= 2.4

Add this line to your application's Gemfile:

```ruby
gem 'iml-imdb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iml-imdb

## Usage
### Code

```ruby
search = IML::IMDB.new('transformers')
search.result
=> [#<IML::Movie title="Transformers", href="/title/tt0418279/?ref_=fn_al_tt_1", year="2007">,
    #<IML::TVSeries title="The Transformers", href="/title/tt0086817/?ref_=fn_al_tt_2", year="1984">,
    #<IML::Movie title="The Transformers: The Movie", href="/title/tt0092106/?ref_=fn_al_tt_3", year="1986">]

movie = IML::Movie.new(title: 'Transformers')
=> #<IML::Movie title="Transformers">
movie.imdb
=> #<IML::Movie title="Transformers", year="2007", director="Michael Bay", rating="7.1", writer="Roberto Orci, Alex Kurtzman, DreamWorks, Paramount Pictures, Hasbro", summary="An ancient struggle between two Cybertronian races, the heroic Autobots and the evil Decepticons, comes to Earth, with a clue to the ultimate power held by a teenager.", actors="Shia LaBeouf, Megan Fox, Josh Duhamel">
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
