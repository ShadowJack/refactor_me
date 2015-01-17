require 'rails_helper'

RSpec.describe MainController, :type => :controller do

  describe "GET last" do
    it "returns http success" do
      get :last
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET popular" do
    it "returns http success" do
      get :popular
      expect(response).to have_http_status(:success)
    end
  end

end
