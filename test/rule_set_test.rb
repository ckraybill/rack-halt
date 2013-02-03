require_relative "test_helper"

describe Rack::Halt::RuleSet do

  subject { Rack::Halt::RuleSet.new }

  describe '.initialize' do
    it "initializes an empty array of rules" do
      subject.rules.must_equal []
    end
  end

  describe '.halt' do
    before { subject.send(:halt, '/test') }

    it "adds a rule" do
      subject.rules.size.must_equal 1
      subject.rules.first.must_be_kind_of Rack::Halt::Rule
    end
  end
end
