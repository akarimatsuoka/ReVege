class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    @customer=current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render "edit"
    end
  end

  def withdraw
    @customer=current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def bookmark
    @customer = current_customer
    bookmark = Bookmark.where(customer_id: @customer.id).pluck(shop_id) #Bookmarkモデルの中の?
    
    @bookmark_shops = Shop.find(bookmark)
  end

  private

  def
  customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,:email, :postal_code,:address,:phone_number)
  end

  def ensure_guest_customer
   @customer = current_customer
    if @customer.email == "guest@example.com"
      redirect_to my_page_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
