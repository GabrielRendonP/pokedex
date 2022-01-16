require 'rails_helper'

RSpec.describe "MobileMenus", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mobile_menu/index"
      expect(response).to have_http_status(:success)
    end
  end

end
