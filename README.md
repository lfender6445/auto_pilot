# AutoPilot
[![Travis CI](https://travis-ci.org/lfender6445/auto_pilot.svg?branch=master)](https://travis-ci.org/lfender6445/auto_pilot)
[![Code Climate](https://codeclimate.com/github/lfender6445/auto_pilot/badges/gpa.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
<!--
[![Test Coverage](https://codeclimate.com/github/lfender6445/auto_pilot/badges/coverage.svg)](https://codeclimate.com/github/lfender6445/auto_pilot)
-->

a step forward in blog automation
- use this ruby gem to convert your [stackoverflow](http://www.stackoverflow.com/) profile to a [jekyll blog](http://jekyllrb.com/) and [more](#do-i-have-to-use-jekyll)
- fetch questions for a specifc user id and convert them to markdown or html

## how do i
- __install autpilot?__
  - add `gem 'auto_pilot', '~> 2.0.0'` to gemfile as development dependency
  - run `bundle install`
- __use autopilot?__
  - run `bundle exec autopilot` from command line
  - the bin will create a [config file](https://github.com/lfender6445/auto_pilot/blob/master/lib/auto_pilot/templates/auto_pilot_config.rb) in the root of your project
- [customize templates?](#custom-templates)
- [register for an API key?](http://stackapps.com/apps/oauth/register)
- [see demo?](#demo-application)

## custom templates
customized templates are as easy as updating your config:

[full example of config with custom template](https://github.com/lfender6445/auto_pilot_demo/blob/custom_templates/auto_pilot_config.rb#L21)

- we can update our config with an override of [MarkdownConverter#md_template](https://github.com/lfender6445/auto_pilot/blob/e6fd551d64d27cd2a813bb71e6c0997eee9196d2/lib/auto_pilot/markdown_converter.rb#L25)
- for html, override [HTMLConverter#html_template](https://github.com/lfender6445/auto_pilot/blob/e6fd551d64d27cd2a813bb71e6c0997eee9196d2/lib/auto_pilot/html_converter.rb#L27)

## contributing

1. fork it
2. create your feature branch
3. commit your changes

________________________

### do i have to use jekyll
__no__. we are just generating partials from stackoverflow posts - they could be integrated with wordpress or rails projects with ease.

afterall, its just html :)

you will also want to set `disable_front_matter = true` in your config when using outside of jekyll

### demo application
checkout the [demo application](https://github.com/lfender6445/auto_pilot_demo) and experiment

### screenshots

![side by side](http://i.imgur.com/Ffbzequ.png)
________________________
![question view](http://i.imgur.com/O206sol.png)

## todo
- change file naming convention to date question answered
- update config options
  - get questions after date x
  - credit sources
  - support erb templates
