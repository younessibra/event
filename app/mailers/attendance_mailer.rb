class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def attendee_email(attendance)

    @attendance = attendance
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = User.find(@attendance.user_id)
    #@admin = @attendance.event.admin au cas où il faille envoyer à l'admin ?? A tester

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Participation confirmée à '+ @attendance.event.title)
  end
end