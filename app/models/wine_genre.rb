class WineGenre < ActiveHash::Base
  self.data = [
    {id: 0, name: "選択してください"},
    {id: 1, name: "赤ワイン"},
    {id: 2, name: "白ワイン"},
    {id: 3, name: "スパークリング"},
    {id: 4, name: "日本酒"},
    {id: 5, name: "その他"}
  ]
  include ActiveHash::Associations
  has_many :posts

end