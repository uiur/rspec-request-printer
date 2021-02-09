require 'rouge'
RSpec.configure do |config|
  config.after(:each) do |example|
    if example.metadata[:type] == :request && request && response && ENV['RSPEC_REQUEST_PRINTER']
      puts "\n#{request.request_method} #{request.original_url}"

      raw_params = Rspec::Request::Printer.raw_request_params(request)
      raw_params = raw_params.map do |key, value|
        if value.is_a?(String) && value.size > 200
          [key, value[0..200] + '…']
        else
          [key, value]
        end
      end.to_h

      Rspec::Request::Printer.pretty_print(raw_params)

      puts
      if response.body.present?
        Rspec::Request::Printer.pretty_print(response.parsed_body)
      end
    end
  end
end
