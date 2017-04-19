require 'rails_helper'

describe "provider endpoint" do
  before(:each) do
    create_list(:provider, 4, date: "2016-1-01")
    create_list(:provider, 4, date: "2016-1-02")
    create_list(:provider, 4, date: "2016-1-03")
    create_list(:provider, 4, date: "2016-1-04")
  end

  context "POST poviders" do
    it "posts prodivers to database" do
      binding.pry
    end
  end
end
