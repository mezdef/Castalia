require 'spec_helper'

describe "Abouts" do
  describe "Index page" do
    it "should have the content 'About'" do
      visit '/about/index'
      expect(page).to have_content('About')
    end
    it "Should have the coresponding title" do
      visit '/about/index'
      expect(page).to have_title("About")
    end
  end
end
