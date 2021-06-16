class ShopAdmins::ApplicationController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
end
