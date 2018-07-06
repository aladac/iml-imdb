[![build status](https://travis-ci.org/aladac/iml.svg?branch=master)](https://travis-ci.org/aladac/iml)
[![Maintainability](https://api.codeclimate.com/v1/badges/232800c6e4d8778937b2/maintainability)](https://codeclimate.com/github/aladac/iml/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/232800c6e4d8778937b2/test_coverage)](https://codeclimate.com/github/aladac/iml/test_coverage)

# IML

This is a media file handling library which is supposed to "guess" the intended type of media file based on specific naming patterns.
Its main purpose is to serve as runtime for renaming media files according to specified patterns.
The gem includes an executable `iml` through which rename operations are possible.

## Installation

This gem requires ruby >= 2.4

Add this line to your application's Gemfile:

```ruby
gem 'iml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iml

## Usage

### Command Line

```
Usage: iml [options] MEDIA_FILE [MEDIA_FILE] ...
    -v, --[no-]verbose               Run verbosely
    -p, --[no-]pretend               Dry run, do not move any files
    -t, --target PATH                Path to move media files to, default: current directory
    -o, --movie-format FORMAT        Format of the output path of movies, default: '%T (%Y).%f'
    -O, --tv-format FORMAT           Format of the output path of TV series, default: '%T/Season %s/%T - S%SE%E.%f'
    -l, --list-formats               Format description
    -f, --force                      Use the force, override output files

$ iml -v Some.Cool.Movie.2018.1080p.BRRip.x264.aac-GROUP.mp4
I, [2018-07-06T13:38:29.836887 #70771]  INFO -- : Some.Cool.Movie.2018.1080p.BRRip.x264.aac-GROUP.mp4 looks like a movie
I, [2018-07-06T13:38:29.837047 #70771]  INFO -- : Moving Some.Cool.Movie.2018.1080p.BRRip.x264.aac-GROUP.mp4 to Some Cool Movie (2018).mp4
```

### Code

```ruby
[1] pry(main)> title = "An.Interesting.TV.Show.S01E01.1080p.WEBRIP.h265-GROUP.mkv"
=> "An.Interesting.TV.Show.S01E01.1080p.WEBRIP.h265-GROUP.mkv"
[2] pry(main)> IML::Text.new(title).detect
=> #<IML::TVSeries title="An Interesting Tv Show", season="01", episode="01", quality="1080p", source="WEBRIP", codec="h265", group="GROUP", extension="mkv">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/iml.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
