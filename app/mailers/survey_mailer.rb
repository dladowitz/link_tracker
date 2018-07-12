class SurveyMailer < ApplicationMailer

  def recruiting_survey
    @click_tracker_id = params[:click_tracker_id]

    mail(to: params[:email], subject: 'Interviewing Feedback')
  end
end
