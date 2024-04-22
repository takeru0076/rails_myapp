require 'rails_helper'

RSpec.describe "TodoCounts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/todo_counts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
