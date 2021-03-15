class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  def check_guest
    if resouces.email == "guest@example.com"
      redirect_to root_path
      flash[:alert] = "ゲストユーザーの編集・削除はできません"
    end
  end
end
