class Public::CustomersController < ApplicationController

  def show
   @customer = current_customer
  end

  def edit
  @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
     redirect_to customers_my_page_path
      flash[:notice] = "登録情報を更新しました"
    end
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private
  def customer_params
   	params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :telephone_number, :email,  :postal_code, :address)

  end

end
