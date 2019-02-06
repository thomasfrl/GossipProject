require 'rails_helper'

RSpec.describe Gossip, type: :model do

  before(:each) do 
		@gossip = FactoryBot.build(:gossip)  	
  end

  it "has a valid factory" do
    expect(build(:gossip)).to be_valid
  end

   context "validation" do
    it "is valid with valid attributes" do
      expect(@gossip).to be_a(Gossip)
    end
    describe "#title" do
      it { expect(@gossip).to validate_presence_of(:title) }
      it { expect(@gossip).to validate_uniqueness_of(:title).case_insensitive }
      it { is_expected.to allow_value("un_titre_assez_long").for(:title) }
      it { is_expected.to_not allow_value("jk").for(:title) }
    end
    describe "#content" do
      it { expect(@gossip).to validate_presence_of(:content) }
      it { is_expected.to allow_value("un_contenu_assez_long_____").for(:content) }
      it { is_expected.to_not allow_value("trop court").for(:content) }
    end
  end

  context "associations" do
    it { expect(@gossip).to have_many(:tags).with_foreign_key(:gossip_id) }
    it { expect(@gossip).to have_many(:comments).with_foreign_key(:gossip_id) }
    it { expect(@gossip).to have_many(:likes).with_foreign_key(:gossip_id) }
    it { expect(@gossip).to belong_to(:user) }
  end


end
