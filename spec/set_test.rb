require "httparty"
require "json"

RSpec.describe "first_spec" do
  resp = HTTParty.get("http://i1-qa.adis.ws/s/jenny2/942705401_IS.json")
  set_content = JSON.parse(resp.body)

  it "should have items" do
    expect(set_content["items"].length).to eq(6)

  end

  it "should have video" do
    expect(set_content["items"].any? { |h| h["type"] == 'video'  }).to be(true)

  end

  it "should follow naming convention" do
     expect(set_content["items"][5]["src"].split("/").last.match(/^[0-9]{9}_[0-9a-z-]+_[0-9]{9}_[0-9a-z-]+_([0-9]{9})_[0-9a-z-]+_room([0-9]{1,2})?$/).nil?).to be(false)

  end

  it "should  not match" do
     expect(set_content["items"][3]["src"].split("/").last.match(/^[0-9]{9}_[0-9a-z-]+_test?$/).nil?).to be(true)

  end

end
