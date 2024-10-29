# frozen_string_literal: true

require 'rake/clean'
require 'asciidoctor'
require './lib/macports_macros'

task default: %i[build]

CLEAN.include 'html'

desc 'Build the macports guide'
task :build do
  Asciidoctor.convert_file 'guide/index.adoc',
                           safe: :safe,
                           mkdirs: true,
                           to_file: 'html/index.html'
end
