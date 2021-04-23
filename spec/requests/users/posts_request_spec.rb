require 'rails_helper'

RSpec.describe "Users::PostsController", type: :request do
  
  before do
    @post = create(:post)
    @post.image = fixture_file_upload('/files/010061021_2.png','image/png')
    @tag = create(:tag)
    @user = create(:user)
    # sign_in @user

  end
  # let(:user){create(:user)}
  # let(:user_params){attributes_for(:user)}

  describe 'GET #top' do
    it 'topアクションにリクエストすると正常にレスポンスが返ってくる' do
      # post user_registration_path, params: { user: user_params }
      
      get root_path
      expect(response.status).to eq 200
    end

    it 'topアクションにリクエストするとレスポンスに投稿済のポストのwine_nameが存在する' do
      get root_path
      expect(response.body).to include(@post.wine_name)
    end

    it 'topアクションにリクエストするとレスポンスにタグ検索フォームが存在する' do
      get root_path
      expect(response.body).to include('タグ名')
    end
  end
  
  describe 'GET #index' do
    before do
      sign_in @user
    end
    it 'topアクションにリクエストするとuserトップにリダイレクトされる' do
      get root_path
      expect(response.status).to eq 302
    end
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get users_posts_path
      expect(response.status).to eq 200
    end
    # it 'indexアクションにリクエストするとレスポンスに投稿済のポストのwine_nameが存在する' do
    #   get users_posts_path
    #   expect(response.body).to include(@post.wine_name)
    # end

    it 'indexアクションにリクエストするとレスポンスにタグ検索フォームが存在する' do
      get users_posts_path
      expect(response.body).to include('タグ名')
    end
  end
  



end
