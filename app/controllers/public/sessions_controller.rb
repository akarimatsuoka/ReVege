# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :customer_state, only: [:create]

  def after_customer_sign_out_path_for
    about_path
  end
  
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customer_path(customer), notice: 'guestuserでログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def customer_state #退会しているかを判断するメソッド
    @customer = Customer.find_by(email: params[:customer][:email]) #【処理1】 入力されたemailからアカウントを1件取得
    return if !@customer #アカウントを取得できなかった場合、このメソッドを終了する
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted #【処理2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
        redirect_to new_customer_registration_path #退会済みの時のリダイレクト先
    end
  end
end
