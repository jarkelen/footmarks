require 'rails_helper'

describe "Authentication" do

  context "unregistered visitors" do
    it "shows a login option" do
      visit root_path
      expect(page).to have_content I18n.t(".devise.sessions.sign_in")
    end

    it "doesn't show footmarks" do
      visit root_path
      expect(page).not_to have_content I18n.t('.footmark.titles.index')
    end
  end

  describe "guest user" do
    user = FactoryGirl.create(:user, email: "test@test.nl", role: 'guest')
    
    it "shows a login option" do
      visit root_path
      expect(page).to have_content I18n.t(".devise.sessions.sign_in")
    end
  
    before :each do
      sign_in(user)
    end
    
    it "can login" do
      visit root_path
      expect(page).to have_content I18n.t('.footmark.titles.index')
    end

    it "shows a logout option" do
      visit root_path
      expect(page).to have_content I18n.t(".devise.sessions.sign_out")
    end
  end
end