RSpec.describe Xinrenxinshi do
  let(:client) {
    Xinrenxinshi::Client.new(ENV['xrxs_app_key'], ENV['xrxs_app_secret'])
  }

  it "has a version number" do
    expect(Xinrenxinshi::VERSION).not_to be nil
  end

  it "could get departments list" do
    results =  client.get_departments
    expect(results["code"]).to eq(0)
    expect(results["message"]).to eq("成功")
    expect(results["data"].length).to be > 0
  end

  it "could get employees list" do
    results =  client.get_employees
    expect(results["code"]).to eq(0)
    expect(results["message"]).to eq("成功")
    expect(results["data"].length).to be > 0
  end

  it "could get employee by id" do
    result =  client.get_employee("your_employee_key")
    expect(result["code"]).to eq(0)
    expect(result["message"]).to eq("成功")
    expect(result["data"]).not_to be nil
  end
end
