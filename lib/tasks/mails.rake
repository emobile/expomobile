namespace :mails do
  task :send => :environment do
    @attendees = Attendee.all
    attendee = Attendee.find_by_id(404)
    AttendeeMailer.welcome_email(attendee).deliver! if !attendee.a_email.nil?
#   @attendees.each do |attendee|
#     AttendeeMailer.welcome_email(attendee).deliver! if !attendee.a_email.nil?
#    end
  end
end
