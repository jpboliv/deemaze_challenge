class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Welcome to Deemaze TODO's", from: "teste@example.com"
    end
end
