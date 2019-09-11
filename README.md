# MarkyMarkdown
MarkyMarkdown's purpose is to read markdown from escaped GitHub Issues bodies and identify vairables. This is intended to be used with GitHub Actions. The plan is to make this a little versatile, but for now leverage it from this repo.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'marky_markdown'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marky_markdown

## Usage

```
test_phrase = "<!--#\r\nEXAMPLE=mother\r\n$-->\r\nSay hi to your {{ EXAMPLE }} for me"
transformation = MarkyMarkdown::Transformer.transform(test_phrase)

p transformation

"<!--#\r\nEXAMPLE=mother\r\n$-->\r\nSay hi to your mother for me"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/marky_markdown. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MarkyMarkdown project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/marky_markdown/blob/master/CODE_OF_CONDUCT.md).

_This project is unrelated to the npm [marky-markdown](https://www.npmjs.com/package/marky-markdown) package_
