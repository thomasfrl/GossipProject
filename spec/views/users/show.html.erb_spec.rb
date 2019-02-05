require 'rails_helper'

RSpec.describe "users/show", type: :view do
  context 'it says welcome' do
    it "displays 'welcome'" do
      # dit à la view que @user sera le build d'un utilisateur avec "lol@email.com" comme email
      assign(:user, build(:user, email: "lol@email.com"))
  
      # génère la vue (ceci doit être fait après avoir assigné la variable d'instance, pour qu'il puisse la trouver)
      render
      
      # la vue rendered doit afficher l'email passé
      expect(rendered).to match /lol@email.com/
    end
  end
end
