# AutoPilot
[![Travis CI](https://travis-ci.org/lfender6445/auto_pilot.svg?branch=master)](https://travis-ci.org/lfender6445/auto_pilot)
[![Code Climate](https://codeclimate.com/github/lfender6445/auto_pilot/badges/gpa.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
<!--
[![Test Coverage](https://codeclimate.com/github/lfender6445/auto_pilot/badges/coverage.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
-->

use this ruby gem to convert your [stackoverflow](http://www.stackoverflow.com/) profile to a [jekyll blog](http://jekyllrb.com/)

in its current form, autopilot will fetch questions for a specifc user and convert them to markdown (jekyll ready) or html

## how do i
- install autpilot?
  - add `gem 'auto_pilot', '~> 0.3.0'` to gemfile as development dependency
- use autopilot?
  - run `bundle exec autopilot` from command line to get started
- [configure](https://github.com/lfender6445/auto_pilot/blob/master/lib/auto_pilot/templates/auto_pilot_config.rb) autopilot?
  - running `autopilot` from the command will generate a config in the root of your project
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
- change file naming convention to date question answered
- update configuration options
  - get questions after date x
  - add credit_sources
