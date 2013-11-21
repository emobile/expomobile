namespace :mails do
  task :send => :environment do
    @attendees = Attendee.where("ID > 34 AND a_email NOT LIKE 'N/A'")
    @attendees.each do |attendee|
      AttendeeMailer.welcome_email(attendee).deliver!
    end
  end
end