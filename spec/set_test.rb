require "httparty"
require "json"

RSpec.describe "set_test" do
# tests that set_content matches all_regex
# config file initialize and parse

config_file = open('./fixtures/config.json')
config = JSON.parse(config_file.read)
all_regex = config["allProdRegEx"]

# set_content initialize
file = open("./fixtures/set_content.json")
json = JSON.parse(file.read)
output_set_name = json["name"]

output_asset_names = json["items"].map do |item|
  src = item["src"]
  asset_name = src.split('/').last
  asset_name
end
it "should match all_regex" do
  asset_names.all? { |e| e.match(/^([0-9]{9}).*$/)  }
end

end
