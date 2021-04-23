require 'rails_helper'

RSpec.describe "Shops::Posts", type: :request do
  describe "GET /shops/posts" do
    it "works! (now write some real specs)" do
      get shops_posts_index_path
      expect(response).to have_http_status(200)
    end
  end
end
