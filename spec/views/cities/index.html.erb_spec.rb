require 'rails_helper'

RSpec.describe "cities/index.html.erb", type: :view do
  context 'when there are cities' do  
    it 'displays the details' do
      # déclare la variable cities, qui est une array contenant des villes
      assign(:cities,
        [
          build(:city, name: "Bordeaux"),
          build(:city, zip_code: "34000"),
          build(:city),
          build(:city)
        ]
      )
  
      render
  
      # vérifie que le name d'une des villes soit affiché
      expect(rendered).to match /Bordeaux/
  
      # vérifie que le zip_code d'une ville soit affiché
      expect(rendered).to match /34000/
    end
  end

  context 'other context' do  
    it 'should display something' do
      # ton test
    end
  end
end
