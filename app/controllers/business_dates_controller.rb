class BusinessDatesController < ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update shoe delete)
  
  def new
    @business_date = BusinessDate.new
  end

  def create
    @business_date = BusinessDate.new(business_date_params)
    if @business_date.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @business_date = BusinessDate.find(params[:id])
  end
  
  def update
    @business_date = BusinessDate.find(params[:id])
    if @business_date = BusinessDate.update(business_date_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @business_date = BusinessDate.find(params[:id])
    @business_date.destroy
  end

  private
  def business_date_params
    params.require(:business_date).permit(:monday, :tuesday, :wedensday, :thursday, :friday, :saturday, :sunday, :monday_opening_time, :monday_closing_time, :tuesday_opening_time, :tuesday_closing_time, :wedensday_opening_time, :wedensday_closing_time, :thursday_opening_time, :thursday_closing_time, :friday_opening_time, :friday_closing_time, :saturday_opening_time, :saturday_closing_time, :sunday_opening_time, :sunday_closing_time).merge(shop_admin_id: current_shop_admin.id)
  end
end
