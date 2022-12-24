require 'rails_helper'

RSpec.describe Customer, type: :system do
  let(:customer) { create(:customer) }
  let(:other_customer) { create(:customer) }

  describe 'Customer CRUD' do

    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            # ユーザー新規登録画面へ遷移
            visit new_customer_registration_path
            # Emailテキストフィールドにtest@example.comと入力
            fill_in 'Email', with: 'test@example.com'
            # Passwordテキストフィールドにpasswordと入力
            fill_in 'Password', with: 'password'
            # Password confirmationテキストフィールドにpasswordと入力
            fill_in 'Password confirmation', with: 'password'
            # 新規会員登録と記述のあるsubmitをクリックする
            click_button '新規会員登録'
            # login_pathへ遷移することを期待する
            expect(current_path).to eq my_page_path
            # 遷移されたページに'User was successfully created.'の文字列があることを期待する
            expect(page).to have_content 'アカウント登録が完了しました。'
          end
        end

        context 'メールアドレス未記入' do
          it 'ユーザーの新規作成が失敗' do
            # ユーザー新規登録画面へ遷移
            visit new_customer_registration_path
            # Emailテキストフィールドをnil状態にする
            fill_in 'Email', with: nil
            # Passwordテキストフィールドにpasswordと入力
            fill_in 'Password', with: 'password'
            # Password confirmationテキストフィールドにpasswordと入力
            fill_in 'Password confirmation', with: 'password'
            # 新規会員登録と記述のあるsubmitをクリックする
            click_button '新規会員登録'
            # users_pathへ遷移することを期待する
            expect(current_path).to eq current_path
            # 遷移されたページに'メールアドレスを入力してください'の文字列があることを期待する
            expect(page).to have_content "メールアドレスを入力してください"
          end
        end

        context '登録済メールアドレス' do
          it 'ユーザーの新規作成が失敗する' do
            # ユーザー新規登録画面へ遷移
            visit new_customer_registration_path
            # Emailテキストフィールドにlet(:user)に定義したユーザーデータのemailを入力
            fill_in 'Email', with: customer.email
            # Passwordテキストフィールドにpasswordと入力
            fill_in 'Password', with: 'password'
            # Password confirmationテキストフィールドにpasswordと入力
            fill_in 'Password confirmation', with: 'password'
            # 新規会員登録と記述のあるsubmitをクリックする
            click_button '新規会員登録'
            # 今いるページに遷移することを期待する
            expect(current_path).to eq currrent_path
            # 遷移されたページに'メールアドレスはすでに存在します'の文字列があることを期待する
            expect(page).to have_content "メールアドレスはすでに存在します"
          end
        end
      end
    end
  end
end