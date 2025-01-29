class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_current_user

  # フラッシュメッセージのキーを許可する
  add_flash_types :success, :danger

  private
  def set_current_user
    @user = current_user
  end
end
