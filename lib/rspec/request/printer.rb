require 'rspec'
require 'rspec/request/printer/version'
require 'rspec/request/printer/hooks'

module Rspec
  module Request
    module Printer
      def self.raw_request_params(request)
        original = request.delete_header('action_dispatch.request.request_parameters')
        request.request_parameters
      ensure
        request.set_header('action_dispatch.request.request_parameters', original)
      end
    end
  end
end
