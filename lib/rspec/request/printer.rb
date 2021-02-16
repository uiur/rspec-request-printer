require 'rspec'
require 'rspec/request/printer/version'
require 'rspec/request/printer/hooks'

module Rspec
  module Request
    module Printer
      def self.raw_request_params(request)
        original = request.delete_header('action_dispatch.request.request_parameters')
        request.request_parameters.to_hash
      ensure
        request.set_header('action_dispatch.request.request_parameters', original)
      end

      def self.pretty_print(hash)
        source = JSON.pretty_generate(hash)

        lexer = Rouge::Lexers::JSON.new
        theme = Rouge::Themes::Base16::Solarized.new
        formatter = Rouge::Formatters::Terminal256.new(theme)
        puts formatter.format(lexer.lex(source))
      end
    end
  end
end
