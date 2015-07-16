
# Colorized SQL Logging Backport for ActiveRecord

Thanks to the work of Chris Tonkinson (@cmtonkinson) Rails 5 will have granular SQL logging so you can easily see SELECT, INSERT, UPDATE, DELETE, and transaction statements in your log. This gem is a tested backport of that colorized logging feature.

https://github.com/rails/rails/pull/20607

![d9801b3a-14f5-11e5-9d32-9d7df2a5c345](https://cloud.githubusercontent.com/assets/2381/8701846/45642a6a-2ae2-11e5-8494-b2cb752645b7.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-sqlcolor-logging'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install activerecord-sqlcolor-logging
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

We use the [appraisal](https://github.com/thoughtbot/appraisal) gem to help us generate the individual Gemfiles for each ActiveRecord version and to run the tests locally against each generated Gemfile. The `bundle exec rake appraisal test` command actually runs our test suite against all Rails versions in our `Appraisal` file. If you want to run the tests for a specific Rails version, use `rake -T` for a list. For example, the following command will run the tests for Rails 3.2 only.

```shell
$ bundle exec appraisal activerecord32 rake test
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/customink/activerecord-sqlcolor-logging.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

