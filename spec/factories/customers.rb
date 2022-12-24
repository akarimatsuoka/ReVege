FactoryBot.define do
  factory :customer do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    last_name {'test'}
    first_name {'test'}
    last_name_kana {'test'}
    first_name_kana {'test'}
    postal_code {'1111111'}
    address {'test'}
    phone_number {'00000000000'}
  end
end