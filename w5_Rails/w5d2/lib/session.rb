require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req
  end

  def [](key)
    @key = key
  end

  def []=(key, val)
    @key = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    Rack::Response.set_cookie('_rails_lite_app')
  end

end

Rack:Response
