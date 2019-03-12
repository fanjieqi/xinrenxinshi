RSpec.describe Xinrenxinshi do
  it "has a version number" do
    expect(Xinrenxinshi::VERSION).not_to be nil
  end

  it "could get departments list" do
    departments = Xinrenxinshi::Department.new(ENV['xrxs_app_key'], ENV['xrxs_app_secret'])
    results =  departments.all
    expect(results["errcode"]).to eq(0)
    expect(results["errmsg"]).to eq("ok")
    expect(results["detailMsg"]).to be nil
    expect(results["department"].length).to be > 0
  end
end
