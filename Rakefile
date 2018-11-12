require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet_blacksmith/rake_tasks'
require 'puppet-strings/tasks'

exclude_paths = %w(
  pkg/**/*
  vendor/**/*
  .vendor/**/*
  spec/**/*
)
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc 'Run tests metadata_lint, release_checks'
task test: [
  :metadata_lint,
  :release_checks,
]
# vim: syntax=ruby
