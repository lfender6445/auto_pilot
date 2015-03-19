# AutoPilot
[![Travis CI](https://travis-ci.org/lfender6445/auto_pilot.svg?branch=master)](https://travis-ci.org/lfender6445/auto_pilot)
[![Code Climate](https://codeclimate.com/github/lfender6445/auto_pilot/badges/gpa.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
<!--
[![Test Coverage](https://codeclimate.com/github/lfender6445/auto_pilot/badges/coverage.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
-->

use this ruby gem to convert your [stackoverflow](http://www.stackoverflow.com/) profile to a [jekyll blog](http://jekyllrb.com/)

in its current form, autopilot will fetch questions you've answered and convert them to markdown or html

# install + usage

- add `gem 'auto_pilot', '~> 0.3.0'` to gemfile
- install via `bundle`
- run `bundle exec autopilot` from command line

from there, you can [configure](https://github.com/lfender6445/auto_pilot/blob/master/lib/auto_pilot/templates/auto_pilot_config.rb) auto_pilot's behavior

## how do i
- [customize templates?](https://github.com/lfender6445/auto_pilot_demo#customize-templates)
- [register for an API key?](http://stackapps.com/apps/oauth/register)

## demo application
checkout the [demo application](https://github.com/lfender6445/auto_pilot_demo) and experiment

### screenshots

- [side by side](http://i.imgur.com/Ffbzequ.png)
- [question view](http://i.imgur.com/O206sol.png)

## contributing

1. fork it
2. create your feature branch
3. commit your changes

## todo

- support date of answer in filenames
- get questions after date 2015-03-01
- support embed of original question url
- add documenation for template customization
- add demo repo
