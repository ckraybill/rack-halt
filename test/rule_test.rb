require_relative "test_helper"

describe Rack::Halt::Rule do

  subject { Rack::Halt::Rule }

  describe '.initialize' do
    let(:rule) { '/test' }

    it "assigns the rule" do
      subject.new(rule).rule.must_equal rule
    end
  end

  describe ".matches?" do

    describe "requests without query params" do
      let(:env) { {'PATH_INFO' => '/test'} }

      it "matches with an equivalent string" do
        subject.new('/test').matches?(env).must_equal true
      end

      it "does not match with an unequal string" do
        subject.new('/not-a-match').matches?(env).must_equal false
      end

      it "matches with a matching regexp" do
        subject.new(%r(\/test)).matches?(env).wont_be_nil
      end

      it "does not match with a non-matching regexp" do
        subject.new(%r(not-a-match)).matches?(env).must_be_nil
      end
    end

    describe "requests with query params" do
      let(:env) { {'PATH_INFO' => '/test', 'QUERY_STRING' => 'foo=bar'} }

      it "matches with the same path and query string" do
        subject.new('/test?foo=bar').matches?(env).must_equal true
      end

      it "does not match with a string containing the path but not the query params" do
        subject.new('/test').matches?(env).must_equal false
      end

      it "matches with a regexp with the path and not the query params" do
        subject.new(%r{\/test}).matches?(env).wont_be_nil
      end
    end
  end
end
