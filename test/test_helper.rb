require "rubygems"
require "bundler/setup"

require "minitest/autorun"
require "rack/test"

require "rack/halt"

class Minitest::Spec

  include Rack::Test::Methods

  def app
    Rack::Builder.new {
      use Rack::Halt do
        halt '/application/x-shockwave-application'
        halt %r{\/text\/(css|javascript)}
      end

      run lambda {|env| [200, {}, ['Hello World']]}
    }.to_app
  end

  def self.allow_ok_requests
    it "must allow ok requests" do
      get '/'
      assert_equal 'Hello World', last_response.body
      assert last_response.ok?
    end
  end
end
