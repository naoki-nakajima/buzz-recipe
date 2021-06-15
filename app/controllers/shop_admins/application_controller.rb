class ShopAdmins::ApplicationController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_shop_admin!
end
