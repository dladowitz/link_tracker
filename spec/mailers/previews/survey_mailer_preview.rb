# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def recruiting_survey
     SurveyMailer.with(email: "Satoshi@bitcoin.org", click_tracker_id: ClickTracker.first.id).recruiting_survey
   end
end
