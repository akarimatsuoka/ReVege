class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @customer = current_customer
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合、入力内容を保持したまま前のページに戻るのは、backアクションを定義することで可能。
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    # @customer = current_customer
    @contact = Contact.new(contact_params)
    # @contact.customer_id = @customer.id
    if @contact.save
      flash[:notice] = "※お問い合わせを受け付けました。回答はサイト内にて返信いたします。今しばらくお待ちください。"
      redirect_to new_contact_path
    else
      render :new
    end
  end

  def index
    @contacts = current_customer.contacts.order(created_at: "DESC").page(params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
    # @reply = Contact.find(params[:id][:reply_content])
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :content)
          .merge(
            customer_id: current_customer.id,
            reply_id: params[:reply_id].blank? ? nil : params[:reply_id]
          )
  end
end
