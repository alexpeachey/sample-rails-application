require 'spec_helper'

describe "Pages" do
  describe "GET /" do
    it "displays the home page" do
      get root_path
      response.status.should be(200)
    end
  end
end
