require "json"

class SetOutputHelper
  attr_reader :output_asset_names
  def initialize
    @set = JSON.parse(open("./manifests/processed_set.json").read)
    process_set
  end
  def process_set
    @output_asset_names = @set["items"].map do |item|
      src = item["src"]
      asset_name = src.split('/').last
      asset_name
    end
  end
end
