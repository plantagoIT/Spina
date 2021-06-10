module Spina
  class UserMailer < ActionMailer::Base
    layout 'spina/mail'

    def forgot_password(user)
      @user = user

      mail(
        to: @user.email, 
        subject: t('spina.forgot_password.mail_subject')
      )
    end

    private

      def current_account
        Spina::Account.first
      end
  end
end
