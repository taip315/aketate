require 'rails_helper'

RSpec.describe Post, type: :form do
  before do
    @post = FactoryBot.build(:posts_tag)
    @post.image = fixture_file_upload('/files/photo-1498429152472-9a433d9ddf3b.jpeg')
  end

  describe '新規投稿' do
    context '新規投稿できるとき' do
      it 'image、wine_name、content、open_date、price、name, があれば新規投稿をすることができる。' do
        expect(@post).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'imageを選択していないと投稿ができない' do
        @post.image = ''
        @post.valid?
        expect(@post.errors.full_messages).to include '商品画像を選択してください'
      end

      it 'wine_nameが空だと投稿ができない' do
        @post.wine_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include 'お酒の名前を入力してください'
      end

      it 'open_dateが空だと投稿ができない' do
        @post.open_date = ''
        @post.valid?
        expect(@post.errors.full_messages).to include '開栓日を入力してください'
      end

      it 'priceが空だと投稿ができない' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include '商品価格を入力してください'
      end

      it 'wine_genre_idが空だと投稿ができない' do
        @post.wine_genre_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include 'ジャンルを入力してください'
      end

      it 'contentが空だと投稿ができない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include '投稿詳細を入力してください'
      end

      it 'name(タグ)が空だと投稿ができない' do
        @post.name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include 'タグを入力してください'
      end

      it 'sold_out(販売状況)が未選択だと投稿ができない' do
        @post.sold_out = ''
        @post.valid?
        expect(@post.errors.full_messages).to include '販売状況を入力してください'
      end

      it 'priceは数値で入力しなければならない' do
        @post.price = '二千'
        @post.valid?
        expect(@post.errors.full_messages).to include '商品価格は数値で入力してください'
      end

      it 'vintageは数値で入力しなければならない' do
        @post.vintage = '一九九九'
        @post.valid?
        expect(@post.errors.full_messages).to include 'ヴィンテージは数値で入力してください'
      end
    end
  end
end
