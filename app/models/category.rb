class Category < ActiveHash::Base
  self.data = [
    { id: 0, value: '---' },
    { id: 1, value: 'レディース' },
    { id: 2, value: 'メンズ' },
    { id: 3, value: 'ベビー・キッズ' },
    { id: 4, value: 'インテリア・住まい・小物' },
    { id: 5, value: '本・音楽・ゲーム' },
    { id: 6, value: 'おもちゃ・ホビー・グッズ' },
    { id: 7, value: '家電・スマホ・カメラ' },
    { id: 8, value: 'スポーツ・レジャー' },
    { id: 9, value: 'ハンドメイド' },
    { id: 10, value: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
