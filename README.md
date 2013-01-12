# Juxt

A simple gem to provide juxtaposition to Objects and Arrays

Example

```ruby
['foo', 'bar'].map_juxt :upcase, :reverse
# [['FOO', 'oof'], ['BAR', 'rab']]

'foo'.juxt :upcase, :reverse
# ['FOO', 'oof']

{:foo => 'foo', :bar => 'bar'}.juxt :foo, :bar
# ['foo', 'bar']

# Procs and Lambdas are ok too
proc = Proc.new{ |m| m.class }
lambda = ->(m){ m.length + 100 }
'foo'.juxt proc, lambda
# [String, 103]

# Need to create a hash from some Object properties/method/attributes?
arr = ['foo', 'bar']
Hash[arr.map_juxt :upcase, :reverse]
# {'FOO' => 'oof', 'BAR' => 'rab'}
```

## Installation

Add this line to your application's Gemfile:

    gem 'juxt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install juxt

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
