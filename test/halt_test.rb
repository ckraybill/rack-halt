require_relative "test_helper"

describe Rack::Halt do
  allow_ok_requests

  it "returns 404" do
    get '/text/css'
    assert_equal last_response.status, 404
  end

  it "renders not found content when request method is not HEAD" do
    get '/text/javascript'
    last_response.body.must_include '<h1>404 Not Found</h1>'
  end

  it "returns no body when request method is HEAD" do
    head '/application/x-shockwave-application'
    last_response.body.must_be_empty
  end
end
