class ApplicationMailer < ActionMailer::Base
  default from: 'Best Bail <hello@bestbail.com>'
  layout 'mailer'

  def new_bail(bail)
    @bail = bail
    @email = ENV['NOTIFICATION_EMAIL']

    mail to: @email, subject: "#{@bail.title}"
  end
end
