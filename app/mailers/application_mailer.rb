class ApplicationMailer < ActionMailer::Base
  default from: 'hello@bestbail.com'
  layout 'mailer'

  def new_bail(bail)
    @bail = bail

    mail to: "th.cottin76@gmail.com", subject: "Nouveau bail"
  end
end
