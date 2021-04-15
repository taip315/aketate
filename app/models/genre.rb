class Genre < ActiveHash::Base
  self.data = [
      {id: 1, name: '寿司'}, {id: 2, name: '焼肉'}, {id: 3, name: 'フレンチ'},
      {id: 4, name: 'イタリアン'}, {id: 5, name: '韓国料理'}, {id: 6, name: '中華'},
      {id: 7, name: '居酒屋'}, {id: 8, name: 'バー'}, {id: 9, name: 'ラーメン'},
      {id: 10, name: '和食'}
  ]
  include ActiveHash::Associations
  has_many :shops
end