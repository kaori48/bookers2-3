class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!#ログインしていないユーザーはログインページにリダイレクト

 def after_sign_in_path_for(resouce)#サインインでどこに飛ぶか
 	user_path(resouce.id)
 end
 def after_sign_up_path_for(resouce)#新規登録ででどこに飛ぶか
 	user_path(resouce.id)
 end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])#登録のときに名前とEメールを許可する
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])#サインインのさいに名前を許可するか。
  end

end