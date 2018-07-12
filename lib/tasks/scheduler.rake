desc "This task is called by the Heroku scheduler add-on"
task :test_scheduler => :environment do
  puts "\n!!!!!!!!!!!! Testing Scheduler !!!!!!!!!!!!!!!!!!!!!!!!!"
  puts "!!!!!!!!!!!! Testing Scheduler !!!!!!!!!!!!!!!!!!!!!!!!!\n"
end

# Should really do this in a job
task :send_interval_emails => :environment do
  waiting_to_send = ClickTracker.where(send_immediately: false, sent_on: nil)
  should_send = waiting_to_send.select do |click_tracker|
    Time.now < (click_tracker.created_at + click_tracker.experiment.wait_interval_days)
  end

  should_send.each do |click_tracker|
    SurveyMailer.with(email: click_tracker.email, click_tracker_id: click_tracker.id).recruiting_survey.deliver_now
  end
end
