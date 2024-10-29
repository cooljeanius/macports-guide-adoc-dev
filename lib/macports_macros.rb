#!/usr/bin/env ruby
# frozen_string_literal: true

require 'asciidoctor'

class MacPortsInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  include Asciidoctor::Logging
  use_dsl

  named :mp
  name_positional_attributes 'group_name'

  def process(parent, target, attrs)
    return unless target == 'group'

    doc = parent.document
    return unless doc.basebackend? 'html'

    group_name = attrs['group_name']
    if group_name == ''
      logger.error 'Missing group name'
      return
    end
    group_github_url = "https://github.com/macports/macports-ports/blob/master/_resources/port1.0/group/#{group_name}.tcl"

    doc.register :links, group_github_url
    create_anchor parent, group_name, type: :link, target: group_github_url
  end
end

Asciidoctor::Extensions.register do
  inline_macro MacPortsInlineMacro
end
