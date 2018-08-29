class ApplicationMailer < ActionMailer::Base
  default from: 'Best Bail <hello@bestbail.com>'
  layout 'mailer'

  def new_bail(bail)
    @bail = bail

    mail to: "th.cottin76@gmail.com, m.racine.pro@gmail.com", subject: "Nouveau bail - #{@bail.title}"
  end
end
