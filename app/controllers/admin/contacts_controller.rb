class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).order(created_at: "DESC")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "送信が完了しました。"
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :subject, :content)
  end
end
