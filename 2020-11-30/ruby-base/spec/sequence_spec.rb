require "sequence"

describe Sequence do
  describe main do
    it "returns 211211" do
      expect(described_class.new.main(1121.to_s)).to eql("211211")
    end
  end
end
