require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Hello. We are skookum, a development company.'" do
      visit '/home'
      expect(page).to have_content('Hello. We are skookum, a development company.') 
    end

    it "should have the title 'home'" do
      visit '/home'
      expect(page).to have_title('home') 
    end

    it "should show the login link for an unauthenticated user" do
        visit '/home'
        expect(page).to have_content('Login') 
    end
    
  end

  describe "Portfolio page" do

    it "should have the title 'portfolio'" do
      visit '/portfolio'
      expect(page).to have_title('portfolio')
    end
  end

end
