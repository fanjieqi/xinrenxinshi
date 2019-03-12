require 'HTTParty'
require 'active_support/all'
require 'base64'
require 'hmac-sha1'

module Xinrenxinshi
  class Department
    include HTTParty
    base_uri "https://api.xinrenxinshi.com/v3"

    def initialize(app_key, app_secret, uuid = nil)
      @app_key = app_key
      @app_secret = app_secret
      @uuid = uuid
    end

    def all
      options = {
        appKey: @app_key,
        timestamp: Time.now.to_i * 1000,
        fetchChild: 1,
      }
      sign = hmacsha1(options.to_query)
      queryString = options.merge(sign: sign).to_query

      self.class.get("/department/list?#{queryString}").parsed_response
    end

    private
      def hmacsha1(data)
        hmac = HMAC::SHA1.new(@app_secret)
        hmac.update(data)
        Base64.encode64(hmac.digest).strip
      end

  end
end
