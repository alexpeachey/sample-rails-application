require 'spec_helper'

describe "Pages" do
  describe "GET /" do
    it "displays the home page" do
      visit root_path
      page.should have_content('Sample')
    end
  end
end
