class SurveyMailer < ApplicationMailer

  def recruiting_survey
    @click_tracker = ClickTracker.find params[:click_tracker_id]
    @click_tracker.update(sent_on: Time.now, email: "Deleted")


    mail(to: params[:email], subject: 'Interviewing Feedback')
  end
end
