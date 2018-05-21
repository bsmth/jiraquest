[![Gem Version](https://badge.fury.io/rb/jiraquest.svg)](https://badge.fury.io/rb/jiraquest)
[![Build Status](https://travis-ci.org/tcob/jiraquest.svg?branch=master)](https://travis-ci.org/tcob/jiraquest)
[![Maintainability](https://api.codeclimate.com/v1/badges/9778ab58de92f3242709/maintainability)](https://codeclimate.com/github/tcob/jiraquest/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9778ab58de92f3242709/test_coverage)](https://codeclimate.com/github/tcob/jiraquest/test_coverage)

# jiraquest

## Install

Installation can be done via rubygems:

```bash
gem install jiraquest
```

## Begin jiraquesting

```bash
jiraquest
```

## Development

Clone the repository (or [fork the repo](https://help.github.com/articles/fork-a-repo/)):

```bash
git clone https://github.com/tcob/jiraquest.git
```

Dependencies are managed using `bundler`

```bash
gem install bundler
bundle install
```

Tests can be run using `rake`:

```bash
rake test
```

### Bumping the version

Edit the version number in `lib/jiraquest/version.rb` then run:

```bash
bundle install
```

The `Gemfile.lock` file should be checked in.
