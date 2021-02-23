module Spina
  module Admin
    class UsersController < AdminController
      before_action :set_breadcrumbs
      before_action :authorize_admin, except: [:index, :edit, :update]
      before_action :set_user, only: [:edit, :update, :destroy]
      before_action :authorize_admin_or_self, only: [:edit, :update]

      def index
        @users = User.all
      end

      def new
        @user = User.new
        add_breadcrumb I18n.t('spina.users.new')
      end

      def create
        @user = User.new(user_params)
        add_breadcrumb I18n.t('spina.users.new')
        if @user.save
          redirect_to admin_users_url
        else
          flash.now[:alert] = I18n.t('spina.users.cannot_be_created')
          render :new
        end
      end

      def edit        
        add_breadcrumb "#{@user}"
      end

      def update        
        add_breadcrumb "#{@user}"
        if @user.update(user_params)
          redirect_to spina.edit_admin_user_url(@user)
        else
          flash.now[:alert] = I18n.t('spina.users.cannot_be_created')
          render :edit
        end
      end

      def destroy        
        @user.destroy unless @user == current_spina_user
        redirect_to admin_users_url
      end

      private

        def set_breadcrumbs
          add_breadcrumb I18n.t('spina.preferences.users'), spina.admin_users_path
        end

        def user_params
          params.require(:user).permit(:admin, :email, :name, :password_digest, :password, :password_confirmation, :last_logged_in)
        end

        def set_user
          @user = User.find(params[:id])
        end

        def authorize_admin_or_self
          render status: 401 unless (current_spina_user.admin? or current_spina_user == @user)
        end
    end
  end
end
