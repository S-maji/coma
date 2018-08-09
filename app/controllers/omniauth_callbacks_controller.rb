class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def all
        # profiderとuidでuserレコードを検索。存在しなければ、新たに作成する
        user = User.from_omniauth(request.env["omniauth.auth"])
        if user.persisted?
          flash["notice"] = "ログインしました。"
          sign_in_and_redirect user, event: :authentication
        else
          session["devise.user_attributes"] = user.attributes
          redirect_to new_user_registration_url
        end
    end
    alias_method :twitter, :all
    alias_method :facebook, :all
end
