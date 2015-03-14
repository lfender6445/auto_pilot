# AutoPilot
[![Travis CI](https://travis-ci.org/lfender6445/auto_pilot.svg?branch=master)](https://travis-ci.org/lfender6445/auto_pilot)
[![Code Climate](https://codeclimate.com/github/lfender6445/auto_pilot/badges/gpa.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
<!--
[![Test Coverage](https://codeclimate.com/github/lfender6445/auto_pilot/badges/coverage.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
-->

use this ruby gem to convert your [stackoverflow](http://www.stackoverflow.com/) profile to a [jekyll blog](https://help.github.com/articles/using-jekyll-with-pages/)

in its current form, autopilot will fetch questions you've answered (with a score greater than 0) and convert them to markdown or html

# install + usage

- add `gem 'auto_pilot', '~> 0.2.0'` to gemfile
- install via `bundle`
- run `autopilot` from command line

from there, you can configure and tweak how autopilot performs

## configuration

more information on possible [configuration options here](https://github.com/lfender6445/auto_pilot/blob/master/lib/auto_pilot/templates/auto_pilot_config.rb)

- it is recommended you [sign up for an API key](http://api.stackexchange.com) prior to using autopilot.

## Contributing

1. fork it
2. create your feature branch
3. commit your changes
