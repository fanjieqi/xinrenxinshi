require 'httparty'
require 'active_support/all'
require "xinrenxinshi/version"
require "xinrenxinshi/department"
require "xinrenxinshi/employee"
require 'xinrenxinshi/util'

module Xinrenxinshi
  class Client
    def initialize(app_key, app_secret, uuid = nil)
      @app_key = app_key
      @app_secret = app_secret
      @uuid = uuid
      @department_client = Department.new(app_key, app_secret)
      @employee_client = Employee.new(app_key, app_secret)
    end

    def get_departments
      @department_client.all
    end

    def get_employees
      @employee_client.all
    end

    def get_employee(id)
      @employee_client.get(id)
    end
  end
end
