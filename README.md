[![Gem Version](https://badge.fury.io/rb/roprquest.svg)](https://badge.fury.io/rb/roprquest)
[![Build Status](https://travis-ci.org/tcob/ROPRQUEST.svg?branch=master)](https://travis-ci.org/tcob/ROPRQUEST)
[![Maintainability](https://api.codeclimate.com/v1/badges/15f82ac543afadb4f995/maintainability)](https://codeclimate.com/github/tcob/ROPRQUEST/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/15f82ac543afadb4f995/test_coverage)](https://codeclimate.com/github/tcob/ROPRQUEST/test_coverage)

# ROPRQUEST

## Install

Installation can be done via rubygems:

```bash
gem install roprquest
```

## Begin ROPRing

```bash
roprquest
```

## Development

Clone the repository (or [fork the repo](https://help.github.com/articles/fork-a-repo/)):

```bash
git clone https://github.com/tcob/ROPRQUEST.git
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

Edit the version number in `lib/roprquest/version.rb` then run:

```bash
bundle install
```

The `Gemfile.lock` file should be checked in.
