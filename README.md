# FbGraphRuby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fb_graph_ruby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fb_graph_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fb_graph_ruby

## Usage

```fb_id``` user messenger ID, it can be read from FB webhook payload. It can be unique for each page.

```access_token``` should be generated on FB page.

```payload``` structured FB [send API](https://developers.facebook.com/docs/messenger-platform/send-api-reference) message.

### Getting User Profile
```ruby
FbGraphRuby::Messenger.get_profile(fb_id, access_token)
```

returnes hash:

```ruby
{
    "first_name"=>"Dmitry", 
    "last_name"=>"Zhuk", 
    "locale"=>"en_US", 
    "timezone"=>3, 
    "gender"=>"male"
}
```

### Sending message

```ruby
payload = {
  text: 'Test message'
}

FbGraphRuby::Messenger.send_message(fb_id, payload, access_token)
```

Response if success:
```json
{ 
  "recipient_id": "1275407512508344", 
  "message_id": "mid.$cAALz5ZrPXlpizaEUaFcnFvLxPQof"
}
```





## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fb_graph_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FbGraphRuby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fb_graph_ruby/blob/master/CODE_OF_CONDUCT.md).
