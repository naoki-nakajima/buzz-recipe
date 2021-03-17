class Users::PasswordsControllse < Devise::PasswordsController
  before_action :check_guest, only: :create
end



