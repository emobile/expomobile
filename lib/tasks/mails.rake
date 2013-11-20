namespace :mails do
  task :send => :environment do
    @attendees = Attendee.all
    @attendees.each do |attendee|
     AttendeeMailer.welcome_email(@attendees).deliver!
    end
  end
end