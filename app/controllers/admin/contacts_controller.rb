class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).order(created_at: "DESC")
  end

  def show
    @contact = Contact.find(params[:id])
    @customer = Customer.find(@contact.customer_id)
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "送信が完了しました。"
      redirect_to request.referer
    else
      render :show
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:reply_content)
  end
end
