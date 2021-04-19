require 'rouge'
RSpec.configure do |config|
  config.after(:each) do |example|
    if example.metadata[:type] == :request && request && response && ENV['RSPEC_REQUEST_PRINTER']
      puts "\n#{request.request_method} #{request.original_url}"

      raw_params = Rspec::Request::Printer.raw_request_params(request)

      # handle params for a request with body of json body
      # for example: `[ { "name": "foo" }, { "name": "bar" } ]`
      if raw_params.has_key?('_json')
        raw_params = raw_params['_json']
      end

      raw_params.each do |key, value|
        if value.is_a?(String) && value.size > 200
          raw_params[key] = value[0..200] + '…'
        end
      end

      Rspec::Request::Printer.pretty_print(raw_params)

      puts
      if response.body.present?
        Rspec::Request::Printer.pretty_print(response.parsed_body)
      end
    end
  end
end
