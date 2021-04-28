# rspec-request-printer

`rspec-request-printer` prints response of JSON API as pretty format when running request specs.

It prints a summary of a request like this format:

```ruby
$ RSPEC_REQUEST_PRINTER=1 bundle exec rspec spec/requests/menus_spec.rb
...
GET http://example.com/menus/72e1c777-547e-450d-ad83-0bf70e5786ca
{}

{
  "id": "72e1c777-547e-450d-ad83-0bf70e5786ca",
  "name": "foobar",
  "status": "published",
  "created_at": "2021-04-05T18:30:49+09:00"
}
```

It's helpful for cases like:

- Check the response body with your eyes when you write JSON API
- Copy it as an example of API response and paste it in a pull request to explain to others

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

With `dotenv`, you can set `RSPEC_REQUEST_PRINTER=1` in `.env.test` file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-request-printer', github: 'uiur/rspec-request-printer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-request-printer

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
