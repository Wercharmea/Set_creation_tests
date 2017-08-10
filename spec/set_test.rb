require "httparty"
require "json"

RSpec.describe "set_test" do

# verifies if a set_content matches all_regex

# config file initialize and parse
config_file = open('./fixtures/config.json')
config = JSON.parse(config_file.read)
all_regex = config["allProdRegEx"]

# set_content initialize
file = open("./fixtures/set_content.json")
json = JSON.parse(file.read)
output_set_name = json["name"]

# new array with asset_names in set_content
output_asset_names = json["items"].map do |item|
  src = item["src"]
  asset_name = src.split('/').last
  asset_name
end

it "should match all_regex" do
  output_asset_names.all? { |e| e.match(all_regex)  }
end

end
