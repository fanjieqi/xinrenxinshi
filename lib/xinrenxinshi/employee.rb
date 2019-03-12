require 'HTTParty'
require 'active_support/all'
require 'xinrenxinshi/util'

module Xinrenxinshi
  class Employee
    include HTTParty
    base_uri "https://api.xinrenxinshi.com/v2"

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
      sign = Util.hmacsha1(@app_secret, options.to_query)
      queryString = options.merge(sign: sign).to_query

      self.class.get("/employee/getAllEmployee?#{queryString}").parsed_response
    end

    def get(id)
      options = {
        appKey: @app_key,
        timestamp: Time.now.to_i * 1000,
        id: id,
        type: 2,
      };
      sign = Util.hmacsha1(@app_secret, options.to_query)
      queryString = options.merge(sign: sign).to_query

      self.class.get("/employee/getEmployeeInfoById?#{queryString}").parsed_response
    end

  end
end
