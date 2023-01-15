class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).order(created_at: "DESC")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    @customer = @contact.customer
    @contact.customer_id = @customer.id
    if @contact.save
      flash[:notice] = "送信が完了しました。"
      redirect_to admin_contact_path
    else
      render :show
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :subject, :content, :reply_content, :customer_id)
  end
end
