require "json"
require "yaml"

template = YAML.load_file('./fixtures/name_template.yml')
file = open("./fixtures/set_content.json")
json = JSON.parse(file.read)
# set_name
output_set_name = json["name"]
output_asset_names = []
output_asset_names = json["items"].map do |item|
  src = item["src"]
  asset_name = src.split('/').last
  asset_name
end

# config
config_file = open('./fixtures/config.json')
config = JSON.parse(config_file.read)
# all_regex = config["allProdRegEx"]
config_yaml = config.to_yaml
all_regex = config_yaml[allProdRegEx]
puts all_regex
#
# #asset_names.all? { |e| e.match(/^([0-9]{9}).*$/)  }
# # puts set_content
# puts output_set_name == template["name"]
#  asset_names.all? { |e| e.match(/^([0-9]{9}).*$/)  }
