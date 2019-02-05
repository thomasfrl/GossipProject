require 'rails_helper'

RSpec.describe "gossips/index.html.erb", type: :view do
  context 'when there are gossips' do  
    it 'displays the details' do
      # déclare la variable gossips, qui est une array contenant des villes
      assign(:users,
        [
          FactoryBot.build(:user, first_name: "thomas", last_name: "feral"),
          FactoryBot.build(:user, first_name: "jean", last_name: "blabla")
        ]
      )
      assign(:gossip, FactoryBot.build(:gossip)
    
  
      render
  
      # vérifie que le nom des user soit affiché
      expect(rendered).to match /thomas/
      expect(rendered).to match /feral/
      expect(rendered).to match /jean/
    end
  end

  context 'when failed to make a new gossip' do  
    it 'should signal it' do
      # déclare la variable gossip, qui est le nouveau gossip
      assign(:users,
        [
          FactoryBot.build(:user, first_name: "thomas", last_name: "feral"),
          FactoryBot.build(:user, first_name: "jean", last_name: "blabla")
        ]
      )
      assign(:gossip, Gossip.create(title: "u", content: "po"))
      render 
      
      expect(rendered).to match /réussi/
      expect(rendered).to match /assez/
      expect(rendered).to match /long/
      expect(rendered).to match /content/
      expect(rendered).to match /title/

    end
  end

  context 'when you go to it the normal way' do  
    it 'should not declare the fail of creation of a gossip' do
      assign(:users,
        [
          FactoryBot.build(:user, first_name: "thomas", last_name: "feral"),
          FactoryBot.build(:user, first_name: "jean", last_name: "blabla")
        ]
      )
      assign(:gossip, FactoryBot.build(:gossip)
    
      render 
      
      expect(rendered).to_not match /réussi/
    end
  end

end
