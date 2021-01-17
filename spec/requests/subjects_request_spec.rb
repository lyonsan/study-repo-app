require 'rails_helper'

RSpec.describe "Subjects", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/subjects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/subjects/new"
      expect(response).to have_http_status(:success)
    end
  end

end
