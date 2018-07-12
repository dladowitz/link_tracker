class ClickTrackersController < ApplicationController
  def new
    @experiments = Experiment.all.reverse
    @click_tracker = ClickTracker.new
  end

  def create
    send_immediately = rand(2).zero? ? true : false

    @experiment = Experiment.find(params[:experiment_id])
    @click_tracker = @experiment.click_trackers.create!(click_tracker_params.merge(send_immediately: send_immediately))

    if @click_tracker
      flash[:success] = "Email Recorded"
      redirect_to experiment_click_trackers_path(@experiment)
      send_survey_email #TODO put back if send_immediately
    else
      flash[:danger] = "Something went wrong"
      render @click_tracker
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
    @experiment = Experiment.find(params[:experiment_id])
    @click_trackers = @experiment.click_trackers
  end

  private

  def click_tracker_params
    params.require(:click_tracker).permit(:email)
  end

  def send_survey_email
    SurveyMailer.with(email: @click_tracker.email, click_tracker_id: @click_tracker.id).recruiting_survey.deliver_now
  end
end
