class ApplicationController < ActionController::Base
  before_action :basic_auth      #ベーシック認証
  before_action :authenticate_user!   #ユーザーをログインページに促す
  before_action :configure_permitted_parameters, if: :devise_controller?    #ネームカラムに保存する

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end



end
