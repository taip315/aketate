class Gender < ActiveHash::Base
  self.data = [
    {id: 0, name: "選択してください"},
    {id: 1, name: "男性"},
    {id: 2, name: "女性"},
    {id: 3, name: "回答しない"}
  ]

end