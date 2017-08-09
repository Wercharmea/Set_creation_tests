require "yaml"
require "json"

RSpec.describe "set_output_test" do
  # set_output_test should verify if
  # set_content in DAM matches with template

  template = YAML.load_file('./fixtures/name_template.yml')
  file = open("./fixtures/set_content.json")
  json = JSON.parse(file.read)
  output_set_name = json["name"]

  output_asset_names = json["items"].map do |item|
    src = item["src"]
    asset_name = src.split('/').last
    asset_name
  end

it "should be equal to template name" do
  output_set_name.should eql(template["name"])
end

it "should include template items" do
  template["items"].all? { |item| output_asset_names.include? item }
end

end
