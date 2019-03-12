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
end
