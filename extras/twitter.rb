class Twitter
  cattr_accessor :CONSUMER_KEY, :CONSUMER_SECRET, :AUTH_TOKEN, :AUTH_SECRET

  # these need to be overridden in config/initializers/production.rb
  @@CONSUMER_KEY = FepOQLwp0eTMxxjLJ6SCOSASN
  @@CONSUMER_SECRET = OmhAeJ8OreUrNtDvFUucKCWcI0FiclMoFBkylQQC1zLn3PINDF
  @@AUTH_TOKEN = 2913829005-B6hFOx1ZB5oGFMPIgO213cgtE4yDWAyUa22LJKV
  @@AUTH_SECRET = BjpyGh5X3SxOWcu52LIKPZSuwv9hgYl539j2c9lk9VU3s

  MAX_TWEET_LEN = 140

  # https://t.co/eyW1U2HLtP
  TCO_LEN = 23

  def self.oauth_consumer
    OAuth::Consumer.new(self.CONSUMER_KEY, self.CONSUMER_SECRET,
      { :site => "https://api.twitter.com" })
  end

  def self.oauth_request(req, method = :get, post_data = nil)
    if !self.AUTH_TOKEN
      raise "no auth token configured"
    end

    begin
      Timeout.timeout(120) do
        at = OAuth::AccessToken.new(self.oauth_consumer, self.AUTH_TOKEN,
          self.AUTH_SECRET)

        if method == :get
          res = at.get(req)
        elsif method == :post
          res = at.post(req, post_data)
        else
          raise "what kind of method is #{method}?"
        end

        if res.class == Net::HTTPUnauthorized
          raise "not authorized"
        end

        if res.body.to_s == ""
          raise res.inspect
        else
          return JSON.parse(res.body)
        end
      end
    end
  end
end
