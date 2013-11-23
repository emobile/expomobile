namespace :mails do
  task :send => :environment do
    output = File.open "mail-output.txt", "a"
    output.puts(Date.today.to_s)
    ["N636", "N358", "N220", "N968", "V278"].each do |attendee_id|
      @attendee = Attendee.find_by_attendee_id(attendee_id)
      output.puts(@attendee.id)
      AttendeeMailer.welcome_email(@attendee).deliver!
      if attendee.a_email =~ /\A[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})\z/
      end
      output.puts("----------------------------")
      output.close
    end
  end
end