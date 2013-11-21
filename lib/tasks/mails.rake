namespace :mails do
  task :send => :environment do
    @attendees = Attendee.all
    @attendees.each do |attendee|
      AttendeeMailer.welcome_email(attendee).deliver! if !attendee.a_email.nil?
    end
  end
end
