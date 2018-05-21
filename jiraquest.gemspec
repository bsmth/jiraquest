# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jiraquest/version'

Gem::Specification.new do |spec|
  spec.name          = 'jiraquest'
  spec.version       = Jiraquest::VERSION
  spec.authors       = ['tcob']
  spec.email         = ['briantcob@gmail.com']

  spec.summary       = 'Immersive jiraquest Text-based adventure game.'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}

  spec.homepage      = 'https://github.com/tcob/jiraquest'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'test-unit'
  spec.add_dependency 'figlet'
  spec.add_dependency 'pastel'
  spec.add_dependency 'ruby-progressbar'
  spec.add_dependency 'tty-prompt'
  spec.add_dependency 'tty-spinner'
end
