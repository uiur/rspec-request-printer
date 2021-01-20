require 'rspec'
require 'rspec/request/printer/version'

RSpec.configure do |config|
  config.after(:each) do |example|
    if example.metadata[:type] == :request && request && response && ENV['RSPEC_REQUEST_PRINTER']
      puts "\n#{request.request_method} #{request.original_url}"
      puts JSON.pretty_generate(Rspec::Request::Printer.raw_request_params(request))
      puts
      if response.body.present?
        puts JSON.pretty_generate(response.parsed_body)
      end
    end
  end
end

module Rspec
  module Request
    class Printer
      def self.raw_request_params(request)
        original = request.delete_header('action_dispatch.request.request_parameters')
        request.request_parameters
      ensure
        request.set_header('action_dispatch.request.request_parameters', original)
      end
    end
  end
end
