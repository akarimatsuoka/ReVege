# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# ここ以下はサイト上の登録情報を入れてるよ！

Admin.find_or_create_by!(email: "a@a") do |admin|
  admin.password = "adminadmin"
end

Customer.find_or_create_by!(email: "6@6") do |customer|
  customer.password = "123456"
  customer.last_name = "test"
  customer.first_name = "test"
  customer.last_name_kana = "test(kana)"
  customer.first_name_kana = "test(kana)"
  customer.postal_code = "6666666"
  customer.address = "熊本県4丁目1番地"
  customer.phone_number = "07072872828"
end

strawberry = Genre.find_or_create_by(name: "いちご")
orange = Genre.find_or_create_by(name: "みかん")
peach = Genre.find_or_create_by(name: "桃")
vegetable = Genre.find_or_create_by(name: "野菜")
jam = Genre.find_or_create_by(name: "ジャム")

shops = [
  {
    name: "松岡ファーム",
    introduction: "熊本の田舎でいちご農園を営んでいます。水と空気の美味しい土地で採れた果物はみずみずしいですよ。土にこだわりを持って育てています。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm1.jpg"), filename:"farm1.jpg"),
    postal_code: 1111111,
    prefecture: "熊本県",
    address: "熊本市x丁目x番地",
    phone_number: "01000000000"
  },
  {
    name: "坂本農園",
    introduction: "test",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm2.jpg"), filename:"farm2.jpg"),
    postal_code: 2222222,
    prefecture: "鹿児島県",
    address: "鹿児島市x丁目x番地",
    phone_number: "02000000000"
  },
  {
    name: "脇坂農園",
    introduction: "test",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm3.jpg"), filename:"farm3.jpg"),
    postal_code: 3333333,
    prefecture: "宮崎県",
    address: "宮崎市x丁目x番地",
    phone_number: "03000000000"
  },
  {
    name: "大橋ファーム",
    introduction: "さつま芋を育ててます。甘いですよー！",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm4.jpg"), filename:"farm4.jpg"),
    postal_code: 4444444,
    prefecture: "大阪府",
    address: "大阪市x丁目x番地",
    phone_number: "04000000000"
  },
  {
    name: "なりなりファーム",
    introduction: "test",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm5.jpg"), filename:"farm5.jpg"),
    postal_code: 5555555,
    prefecture: "愛知県",
    address: "半田市x丁目x番地",
    phone_number: "05000000000"
  },
  {
    name: "西崎ファーム",
    introduction: "test",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm6.jpg"), filename:"farm6.jpg"),
    postal_code: 6666666,
    prefecture: "熊本県",
    address: "合志市x丁目x番地",
    phone_number: "06000000000"
  }
]

shops.each do |shop|
  Shop.find_or_create_by(name: shop[:name]) do |s|
    s.introduction = shop[:introduction]
    s.image = shop[:image]
    s.postal_code = shop[:postal_code]
    s.prefecture = shop[:prefecture]
    s.address = shop[:address]
    s.phone_number = shop[:phone_number]
  end
end

items = [
  {
    genre_id: strawberry.id,
    shop_id: 1,
    name: "いちご(不揃い）",
    detail: "形は悪いですが水と空気の美味しい土地で採れたいちごはみずみずしく糖度が高いです。１パック約２０粒入っています。２パックからご購入いただけます。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item1.jpg"), filename:"item1.jpg"),
    price: 400,
    status: "true"
  },
  {
    genre_id: 3,
    shop_id: 2,
    name: "桃",
    detail: "今年は豊作で予想以上の桃ができてしまいました。みずみずしく甘い旬の桃をぜひご賞味ください。3つセットでお送りします。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item2.jpg"), filename:"item2.jpg"),
    price: 500,
    status: "true"
  },
  {
    genre_id: 2,
    shop_id: 3,
    name: "みかん",
    detail: "甘いみかんですよ。サラダなんかに入れるのも美味しいですよ。１箱15個入りです。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item3.jpg"), filename:"item3.jpg"),
    price: 400,
    status: "true"
  },
  {
    genre_id: 4,
    shop_id: 4,
    name: "さつまいも",
    detail: "秋の味覚さつまいもが今年もたくさん採れました。そのまま蒸して食べても良し。我が家ではさつまいもご飯にしました。お一ついかがですか？５本セットです。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item4.jpg"), filename:"item4.jpg"),
    price: 500,
    status: "true"
  },
  {
    genre_id: 5,
    shop_id: 5,
    name: "いちごジャム",
    detail: "今年うちでできたイチゴをいちごジャムにリメイクしました。いちごそのものを生かした甘酸っぱいジャムです。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item5.jpg"), filename:"item5.jpg"),
    price: 300,
    status: "true"
  },
  {
    genre_id: 4,
    shop_id: 6,
    name: "白菜",
    detail: "白菜がたくさんできたのでお裾分けします。お鍋の具材にお一ついかがですか。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item6.jpg"), filename:"item6.jpg"),
    price: 350,
    status: "true"
  },
  {
    genre_id: 5,
    shop_id: 3,
    name: "みかんジャム",
    detail: "今年うちでできたみかんをいちごジャムにリメイクしました。砂糖少なめで素材を生かした甘酸っぱいジャムです。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item7.jpg"), filename:"item7.jpg"),
    price: 300,
    status: "true"
  },
  {
    genre_id: 4,
    shop_id: 4,
    name: "ミニトマト",
    detail: "ミニトマトが今年は豊作でした。余って捨ててしまうのも勿体無いのでお一ついかがですか？サラダなどに入れてリコピンを摂りましょう！",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item8.jpg"), filename:"item8.jpg"),
    price: 200,
    status: "true"
  },
  {
    genre_id: 4,
    shop_id: 1,
    name: "玉ねぎ",
    detail: "今年の玉ねぎはとても甘く自信作です！さまざまなお料理に使えますよ。１袋５個入りです。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item9.jpg"), filename:"item9.jpg"),
    price: 300,
    status: "true"
  },
  {
    genre_id: 5,
    shop_id: 1,
    name: "いちごジャム",
    detail: "不揃いのいちごをジャムにしました。あえて大粒の果肉を残した、いちごの甘味と酸味が感じられるジャムです。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item10.jpg"), filename:"item10.jpg"),
    price: 300,
    status: "true"
  },
  {
    genre_id: 3,
    shop_id: 2,
    name: "桃（不揃い）",
    detail: "今年できた桃の中で形が不揃いのものです。形は悪いですが味は変わらず甘くみずみずしいのでぜひご賞味ください。3つセットでお送りします。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item11.jpg"), filename:"item11.jpg"),
    price: 250,
    status: "true"
  }
]

items.each do |item|
  Item.find_or_create_by(name: item[:name]) do |i|
    i.genre_id = item[:genre_id]
    i.shop_id = item[:shop_id]
    i.detail = item[:detail]
    i.image = item[:image]
    i.price = item[:price]
    i.status = item[:status]
  end
end

guest = Customer.guest
guest_id = guest.id

orders = [
  {
    customer_id: guest_id,
    address: "熊本県熊本市x丁目x番地",
    postal_code: "1111111",
    name: "test",
    order_status: 2,
    payment_method: 0,
    postage: 600,
    price: 1000
  },
  {
    customer_id: guest_id,
    address: "京都府京都市x丁目x番地",
    postal_code: "2222222",
    name: "test",
    order_status: 1,
    payment_method: 1,
    postage: 600,
    price: 900
  },
  {
    customer_id: guest_id,
    address: "大阪府大阪市x丁目x番地",
    postal_code: "3333333",
    name: "test",
    order_status: 0,
    payment_method: 1,
    postage: 600,
    price: 800
  },
  {
    customer_id: guest_id,
    address: "沖縄県那覇市x丁目x番地",
    postal_code: "4444444",
    name: "test",
    order_status: 0,
    payment_method: 0,
    postage: 600,
    price: 1160
  }
]

orders.each do |order|
  Order.find_or_create_by(
    customer_id: order[:customer_id],
    address: order[:address],
    postal_code: order[:postal_code],
    name: order[:name],
    order_status: order[:order_status],
    payment_method: order[:payment_method],
    postage: order[:postage],
    price: order[:price]
  )
end

ShippingAddress.find_or_create_by!(
  customer_id: guest_id,
  address: "熊本県熊本市x丁目x番地",
  postal_code: "2222222",
  name: "test"
)

order_items = [
 {
    order_id: 1,
    item_id: 1,
    quantity: 1,
    price: 400
  },
  {
    order_id: 2,
    item_id: 2,
    quantity: 1,
    price: 300
  },
  {
    order_id: 3,
    item_id: 3,
    quantity: 1,
    price: 200
  },
  {
    order_id: 4,
    item_id: 4,
    quantity: 1,
    price: 560
  }
]

order_items.each do |order_item|
  OrderItem.find_or_create_by(
    order_id: order_item[:order_id],
    item_id: order_item[:item_id],
    quantity: order_item[:quantity],
    price: order_item[:price]
  )
end

p "データ作成しました"
