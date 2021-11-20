class Public::CustomersController < ApplicationController

  def show
   @customer = current_customer
  end

  def edit
  @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def withdrawl
  end

  #いるかいらないかを検討　機能としてはupdateになる?
  def destroy
    current_member.update(is_deleted: true, withdrawal_status: 1)
    reset_session
    redirect_to root_path
  end

private
  def member_params
   	params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :withdrawal_status, :email)
  end

end
