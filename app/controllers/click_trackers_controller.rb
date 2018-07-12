class ClickTrackersController < ApplicationController
  def new
    @experiments = Experiment.all.reverse
    @click_tracker = ClickTracker.new
  end

  def create
    send_immediately = if rand(2).zero?
                        true
                       else
                         false
                       end

    @experiment = Experiment.find(params[:experiment_id])
    @experiment.click_trackers.create(click_tracker_params.merge(send_immediately: send_immediately))

    send_survey_email if send_immediately
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

  end
end
