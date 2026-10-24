# frozen_string_literal: true

RSpec.describe Pubid::Iso do
  describe ".locate_type" do
    it "locates the International Standard class by key" do
      expect(described_class.locate_type(:is))
        .to eq(Pubid::Iso::Identifier::InternationalStandard)
    end

    it "locates by string code" do
      expect(described_class.locate_type("ts"))
        .to eq(Pubid::Iso::Identifier::TechnicalSpecification)
    end

    it "returns nil for an unknown type code" do
      expect(described_class.locate_type(:nonexistent)).to be_nil
    end
  end

  describe ".identifier_types" do
    it "returns classes carrying type metadata" do
      expect(described_class.identifier_types).to all(
        respond_to(:type),
      )
      expect(described_class.identifier_types).to include(
        Pubid::Iso::Identifier::InternationalStandard,
      )
    end
  end
end
