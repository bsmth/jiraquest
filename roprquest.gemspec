# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roprquest/version'

Gem::Specification.new do |spec|
  spec.name          = 'roprquest'
  spec.version       = Roprquest::VERSION
  spec.authors       = ['tcob']
  spec.email         = ['briantcob@gmail.com']

  spec.summary       = 'Immersive ROPRQuest Text-based adventure game.'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}

  spec.homepage      = 'https://github.com/tcob/roprquest'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit'
  spec.add_dependency 'figlet'
  spec.add_dependency 'pastel'
  spec.add_dependency 'random-word'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'ruby-progressbar'
  spec.add_dependency 'tty-prompt'
  spec.add_dependency 'tty-spinner'
end
# rubocop:enable Metrics/BlockLength
