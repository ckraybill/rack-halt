require 'rack'

module Rack::Halt
  autoload :Rule,    'rack/halt/rule'
  autoload :RuleSet, 'rack/halt/rule_set'

  class << self

    def new(app, &rule_block)
      @app = app
      @rule_set = RuleSet.new
      @rule_set.instance_eval(&rule_block) if block_given?

      self
    end

    def call(env)
      if matched_rule = find_first_matching_rule(env)
        return [404, {"Content-Type" => "text/html"}, content_for(env)]
      end
      @app.call(env)
    end

  private

    def find_first_matching_rule(env)
      @rule_set.rules.detect { |rule| rule.matches?(env) }
    end

    def content_for(env)
      env["REQUEST_METHOD"] == "HEAD" ? [] : [content]
    end

    def content
      <<-EOS
<html>
<head><title>404 Not Found</title></head>
<body>
<h1>404 Not Found</h1>
</body>
</html>
      EOS
    end
  end
end
