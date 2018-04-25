class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def like_email(like)
    @like = like
    @myEmail = "BrandonJurado538@gmail.com"
    mail(to: @myEmail, subject: "Someone liked " + @like.game_title + "!")
  end
end
