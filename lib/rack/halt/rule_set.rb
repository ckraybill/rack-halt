module Rack::Halt
  class RuleSet
    attr_reader :rules
    def initialize #:nodoc:
      @rules = []
    end

  protected
    # Creates a halt rule that will stop subsequent middlewares from
    # being called.
    #
    #  halt '/application/x-shockwave-flash'
    #  halt '/text/css'
    #  halt %r{\/text\/(css|javascript)}
    def halt(rule)
      add_rule rule
    end

  private
    def add_rule(rule)
      @rules << Rule.new(rule)
    end
  end
end
