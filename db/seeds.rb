# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ここ以下はサイト上の登録情報を入れてるよ！

# Admin.create!(
#   email: 'a@a',
#   password: 'adminadmin'
#   )

# genres = [
#   { name: 'りんご'},
#   { name: 'いちご'},
#   { name: 'みかん'},
#   { name: '野菜'},
#   { name: 'ジャム'}
# ]
# ActiveRecord::Base.transaction do
#   genres.each do |genre|
#   Genre.create!(genre)
#   end
# end

# Customer.create!(
#   email: '6@6',
#   password: '123456',
#   last_name: "test",
#   first_name: "test",
#   last_name_kana: "test(kana)",
#   first_name_kana: "test(kana)",
#   postal_code: "6666666",
#   address: "熊本県4丁目1番地",
#   phone_number: "07072872828"
#   )

Shop.create!(
[
  {name: '松岡ファーム',
  introduction: '熊本の田舎でいちご農園を営んでいます。水と空気の美味しい土地で採れた果物はみずみずしいですよ。土にこだわりを持って育てています。',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm1.jpg"), filename:"farm1.jpg"),
  postal_code: "1111111",
  prefecture: "熊本県",
  address: "熊本市x丁目x番地",
  phone_number: "01000000000"
  },
  
  {name: '坂本農園',
  introduction: 'test',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm2.jpg"), filename:"farm2.jpg"),
  postal_code: "2222222",
  prefecture: "鹿児島県",
  address: "鹿児島市x丁目x番地",
  phone_number: "02000000000"
  },

  {name: '脇坂農園',
  introduction: 'test',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm3.jpg"), filename:"farm3.jpg"),
  postal_code: "3333333",
  prefecture: "宮崎県",
  address: "宮崎市x丁目x番地",
  phone_number: "03000000000"
  },

  {name: '大橋ファーム',
  introduction: 'さつま芋を育ててます。甘いですよー！',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm4.jpg"), filename:"farm4.jpg"),
  postal_code: "4444444",
  prefecture: "大阪府",
  address: "大阪市x丁目x番地",
  phone_number: "04000000000"
  },
  
  {name: 'なりなりファーム',
  introduction: 'test',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm5.jpg"), filename:"farm5.jpg"),
  postal_code: "5555555",
  prefecture: "愛知県",
  address: "半田市x丁目x番地",
  phone_number: "05000000000"
  },

  {name: '西崎ファーム',
  introduction: 'test',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/farm6.jpg"), filename:"farm6.jpg"),
  postal_code: "6666666",
  prefecture: "熊本県",
  address: "合志市x丁目x番地",
  phone_number: "06000000000"
  },
  ]
  )
  
  #Item.create!(
#[
  # {genre_id: '2'
  # shop_id: '1'
  # name: 'いちご(不揃い）',
  # detail: '形は悪いですが水と空気の美味しい土地で採れたいちごはみずみずしく糖度が高いです。１パック約２０粒入っています。２パックからご購入いただけます。',
  # image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item1.jpg"), filename:"item1.jpg"),
  # price: "400",
  # status: "true"
  # }