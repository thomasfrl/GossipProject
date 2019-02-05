require 'rails_helper'

RSpec.describe "gossips/index.html.erb", type: :view do
  context 'when there are gossips' do  
    it 'displays the details' do
      # déclare la variable gossips, qui est une array contenant des villes
      assign(:gossips,
        [
          FactoryBot.build(:gossip, title: "encore un gossip blbal", content: "plein de petit gokkjkjkjkjkjkkjkjkssip"),
          FactoryBot.build(:gossip, title: "encfjkfjkore un gossip blbal", content: "plein de pfffklfklfketit gokkjkjkjkjkjkkjkjkssip")
        ]
      )
  
      render
  
      # vérifie que le name d'une des villes soit affiché
      expect(rendered).to match /gossip/
  
      # vérifie que le zip_code d'une ville soit affiché
      expect(rendered).to match /encore/
    end
  end

  context 'when you built a new gossip' do  
    it 'should signal it' do
      # déclare la variable gossip, qui est le nouveau gossip
      assign(:gossip,
        [
          FactoryBot.build(:gossip)
        ]
      )
      assign(:gossips,
        [
          FactoryBot.build(:gossip, title: "encore un gossip blbal", content: "plein de petit gokkjkjkjkjkjkkjkjkssip"),
          FactoryBot.build(:gossip, title: "encfjkfjkore un gossip blbal", content: "plein de pfffklfklfketit gokkjkjkjkjkjkkjkjkssip")
        ]
      )

      render 
      
      expect(rendered).to match /réussi/
    end
  end

  context 'when you go to it the normal way' do  
    it 'should not declare the creation of a gossip' do
      assign(:gossips,
        [
          FactoryBot.build(:gossip, title: "encore un gossip blbal", content: "plein de petit gokkjkjkjkjkjkkjkjkssip"),
          FactoryBot.build(:gossip, title: "encfjkfjkore un gossip blbal", content: "plein de pfffklfklfketit gokkjkjkjkjkjkkjkjkssip")
        ]
      )
      render 
      
      expect(rendered).to_not match /réussi/
    end
  end

end
