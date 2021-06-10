class ShopAdmins::ApplicationController < ApplicationController
  layout 'admins/application'
  before_action :authenticate_shop_admin!
end
