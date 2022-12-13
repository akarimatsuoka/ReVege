class Shop < ApplicationRecord
  include JpPrefecture

  def name_display
    id.to_s + ' ,' + name #idがintegerでnameがstringだからto_sをつけて数値変換してる
  end

  has_one_attached :image
  has_many :items, dependent: :destroy #shopを消したらそれに紐づいているitemsも消える
  has_many :bookmarks, dependent: :destroy

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end


#12,15,16,17行目はenumを使用した時の記述（jp_prefectureを使用してればstring型のprefectureカラムを用意さえすればenum使わなくていい）
  # enum prefecture: { hokkaido: 0, aomori: 1, akita: 2, iwate: 3, yamagata: 4, miyagi: 5, fukushima: 6, niigata: 7, gunma: 8, tochigi: 9, ibaraki: 10, saitama: 11, yamanashi: 12, chiba: 13, tokyo: 14, kanagawa: 15, nagano: 16, shizuoka: 17, toyama: 18, ishikawa: 19, gifu: 20, fukui: 21, aichi: 22, shiga: 23, mie: 24, kyoto: 25, osaka: 26, nara: 27, hyogo: 28, wakayama: 29, tottori: 30, okayama: 31, shimane: 32, hiroshima: 33, yamaguchi: 34, kagawa: 35, tokushima: 36, ehime: 37, kochi: 38, fukuoka: 39, saga: 40, nagasaki: 41, oita: 42, kumamoto: 43, miyazaki: 44, kagoshima: 45, okinawa: 46 }

  #def self.prefecture_i18n_names
    #prefectures.map {|k, v| [I18n.t("enums.shop.prefecture.#{k}"), k]}
  #end

end
