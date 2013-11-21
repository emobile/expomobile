namespace :mails do
  task :send => :environment do
    @attendees = Attendee.where("ID > 64 AND a_email NOT LIKE 'N/A'")
    output = File.open "output.txt", "a"
    output.puts(Date.today.to_s)
    @attendees.each do |attendee|
      output.puts(attendee.id)
      AttendeeMailer.welcome_email(attendee).deliver! if attendee.a_email =~ /\A[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})\z/
    end
    output.puts("----------------------------")
    output.close
  end
end