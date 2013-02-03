module Rack::Halt
  class Rule
    attr_reader :rule

    def initialize(rule)
      @rule = rule
    end

    def matches?(rack_env)
      path = build_path_from_env(rack_env)
      string_matches?(path, self.rule)
    end

  private

    def build_path_from_env(env)
      path = env['PATH_INFO'] || ''
      path += "?#{env['QUERY_STRING']}" unless env['QUERY_STRING'].nil? || env['QUERY_STRING'].empty?
      path
    end

    def string_matches?(string, matcher)
      if matcher.is_a?(Regexp)
        string =~ matcher
      elsif matcher.is_a?(String)
        string == matcher
      else
        false
      end
    end
  end
end
