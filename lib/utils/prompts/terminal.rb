# frozen_string_literal: true

require 'ruby-progressbar'

# Simple User Prompts
class Terminal
  def initialize
    form = "\e[0;34m%t: |%B|\e[0m"
    @pbar = ProgressBar.create(length: 80, smoothing: 0.3, format: form)
    @prompt = TTY::Prompt.new
  end

  def r_progress(max, title = 'Connecting')
    @pbar.title = title
    100.times do
      @pbar.increment
      sleep 0.001 * rand(1..max)
    end
  end

  def progress(title = 'Connecting')
    @pbar.title = title
    100.times do
      @pbar.increment
      sleep 0.01
    end
  end

  # rubocop:disable Lint/UselessAssignment
  def amazing_update(_title = 'Connecting')
    steps_message(10)
    steps_message(10, title = 'Contacting Software Sites')
    steps_message(20, title = 'Indexing ROPRs')
    steps_message(10, title = 'Validating Checksums')
    steps_message(30, title = 'Checking Type Safety')
    steps_message(10, title = 'Deleting Previous Work')
    steps_message(10, title = 'Installing')
  end
  # rubocop:enable Lint/UselessAssignment

  def steps_message(steps, title = 'Connecting')
    steps.times do
      @pbar.title = title
      @pbar.increment
      sleep 0.01 * rand(1..20)
    end
  end

  # rubocop:disable Lint/AmbiguousRegexpLiteral
  def two_factor
    @prompt.mask('Please enter your VPNs 2FA PIN:') do |q|
      q.validate /^\d{6}$/, 'Must be a six digit PIN!'
    end
  end
  # rubocop:enable Lint/AmbiguousRegexpLiteral
end
