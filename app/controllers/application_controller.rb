class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # ここから下はユーザーＣから引越した、汎用できるbeforeフィルター
    
  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
    
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  # 各子Ｃ内で@userは定義済なので、@user定義はカット済！
  # （逆に入れるとどっちかの子Ｃでエラーになる！！）
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
    
  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
    
  # 管理権限者、または現在ログインしているユーザー本人を許可します。
  # 各子Ｃ内で@userは定義済なので、@user定義はカット済！
  # （逆に入れるとどっちかの子Ｃでエラーになる！！）
  def admin_or_correct_user
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to(root_url)
    end
  end
end
