class Public::CustomersController < ApplicationController

  def show
   @customer = current_customer
  end

  def edit
  @customer = current_customer
  end

  def update
    if @customer = current_customer
     redirect_to customers_my_page_path
      flash[:notice] = "profile was successfully updated."
    end
  end

 private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :postal_code, :address, :telephone_number, :email)
  end

end
