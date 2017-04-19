require 'rails_helper'

describe "provider endpoint" do
  before(:each) do
    create_list(:provider, 10)
  end

  context "POST poviders" do
    it "posts prodivers to database" do
      binding.pry
    end
  end
end
