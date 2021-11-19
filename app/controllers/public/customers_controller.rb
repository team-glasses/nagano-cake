class Public::CustomersController < ApplicationController
  def show

  end

  def check

  end

  def edit

  end

  def update
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def withdraw
     @customer = customers.find(params[:id])
     redirect_to root_path
  end


end
