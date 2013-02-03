# Rack::Halt

A rack middleware for defining paths that halt the rack request. In
many rack-compliant applications you may find the need to prevent
certain requests from routing to the application. This is an
alternative to instances when you cannot or do not want to write
an Apache or Nginx location block and will be more performant,
than trying to allow the Rails router, for example, handle.


## Current Version

0.0.1


## Requirements

* [Rack](http://rack.github.com/)


## Installation

### Gemfile

Add this line to your application's Gemfile.

```ruby
gem 'rack-halt'
```

And then execute:

```bash
$ bundle
```

### Manual

Or install it yourself.

```bash
$ gem install rack-halt
```


## Usage

### Sample rackup file

```ruby
gem 'rack-halt', '~> 0.0.1'
require 'rack/halt'
use Rack::Halt do
  halt '/application/x-shockwave-application'
  halt %r{\/text\/(css|javascript)}
end
```

### Sample usage in a rails app
```ruby
config.middleware.insert_after(Rack::Lock, Rack::Halt) do
  halt '/application/x-shockwave-flash'
  halt %r{/text/(javascript|css)}
end
```


## Authors

* Chris Kraybill / [@ckraybill](https://github.com/ckraybill)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/ckraybill/rack-halt/issues).


## License

Copyright (c) 2013 Chris Kraybill

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
