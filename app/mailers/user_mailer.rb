class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
  	@user = user
  	@url = 'http://monsite.fr/login'
  	mail(to: @user.email, subject: "Bienvenue sur notre site d'événements !")
  end

  def event_subscription_email(user)
  	@user = user
  	@url = 'http://monsite.fr/login'
  	mail(to: @user.email, subject: "Validation de l'inscription à l'événement")
  end
end
