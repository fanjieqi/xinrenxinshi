require 'base64'
require 'hmac-sha1'

module Xinrenxinshi
  class Util
    protected
      def self.hmacsha1(app_secret, data)
        hmac = HMAC::SHA1.new(app_secret)
        hmac.update(data)
        Base64.encode64(hmac.digest).strip
      end
  end
end
