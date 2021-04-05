# rspec-request-printer

rspec-request-printer prints json api response as pretty format when running request specs.

It's helpful for cases like:

- check the response body with your eyes when you write json api
- copy an example of api response and show it to others in a pull request

## Usage

Run rspec with `RSPEC_REQUEST_PRINTER=1`.

```ruby
$ RSPEC_REQUEST_PRINTER=1 bundle exec rspec spec/requests/menus_spec.rb
GET http://example.com/menus/72e1c777-547e-450d-ad83-0bf70e5786ca
{}

{
  "id": "72e1c777-547e-450d-ad83-0bf70e5786ca",
  "name": "foobar",
  "status": "published",
  "created_at": "2021-04-05T18:30:49+09:00"
}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-request-printer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-request-printer

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
