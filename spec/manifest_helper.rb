require "json"
require "awesome_print"

class ManifestHelper
  attr_reader :processed_manifest

  def initialize
    @manifest = JSON.parse(open("./manifests/argos_script.json").read)
    process_manifest
    @processed_manifest
  end

  def process_manifest
    sets = initialize_sets
    @processed_manifest = {}
    sets.each_pair do |set_name, assets|
      @processed_manifest[set_name] = assets.sort_by {|asset| asset["seq"]}
        .reverse
        .uniq{ |asset| asset["seq"]}
        .reverse
        .map{ |el| el["name"] }
    end
  end

  def initialize_sets
    result = {}

    @manifest["assets"].each do |asset|
      asset["set"].each do |set_name|
        if result.key?(set_name) == false
          result[set_name] = []
        else
          result[set_name] << { "name" => asset["name"], "seq" => asset["seq"] }
        end
      end
    end
    result
  end

end
