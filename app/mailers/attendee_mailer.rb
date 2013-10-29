class AttendeeMailer < ActionMailer::Base
  default :from => "no-reply@expomobile.com.mx"

  def send_nip(attendee, nip)
    @attendee = attendee
    @nip = nip.nip
    mail(:to => @attendee.a_email, :subject => t('atten.mail.nip_subject', @nip))
  end

end