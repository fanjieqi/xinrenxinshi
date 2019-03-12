RSpec.describe Xinrenxinshi do
  it "has a version number" do
    expect(Xinrenxinshi::VERSION).not_to be nil
  end

  it "could get departments list" do
    departments = Xinrenxinshi::Department.new(ENV['xrxs_app_key'], ENV['xrxs_app_secret'])
    results =  departments.all
    expect(results["code"]).to eq(0)
    expect(results["message"]).to eq("成功")
    expect(results["data"].length).to be > 0
  end

  it "could get employees list" do
    employees = Xinrenxinshi::Employee.new(ENV['xrxs_app_key'], ENV['xrxs_app_secret'])
    results =  employees.all
    expect(results["code"]).to eq(0)
    expect(results["message"]).to eq("成功")
    expect(results["data"].length).to be > 0
  end

  it "could get employee by id" do
    employees = Xinrenxinshi::Employee.new(ENV['xrxs_app_key'], ENV['xrxs_app_secret'])
    # Get info of Kevin Yang
    result =  employees.get("38494b8b8e854035ace78b6c62498b2f")
    expect(result["code"]).to eq(0)
    expect(result["message"]).to eq("成功")
    expect(result["data"]).not_to be nil
  end
end
