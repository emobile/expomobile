namespace :mails do
  task :send => :environment do
    @attendees = Attendee.where("ID IN (#{[40,135,142,166,199,272,329].join(",")})")
    output = File.open "output.txt", "a"
    output.puts(Date.today.to_s)
    @attendees.each do |attendee|
      output.puts(attendee.id)
      AttendeeMailer.welcome_email(attendee).deliver!
        #/\A[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})\z/
    end
    output.puts("----------------------------")
    output.close
  end
end