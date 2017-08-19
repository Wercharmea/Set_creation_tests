require_relative "manifest_helper"
require_relative "set_output_helper"

RSpec.describe "argos_script" do
  describe "set" do
    let(:manifest) { ManifestHelper.new.processed_manifest["TUC-10000_R_SET"] }
    let(:output) { SetOutputHelper.new.output_asset_names }
    
    it "contains proper assets in right order" do
      expect(output).to eq(manifest)
    end
  end
end
