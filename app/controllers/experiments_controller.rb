class ExperimentsController < ApplicationController
  before_action :new_experiment,  only: %w[new]
  before_action :find_experiment, only: %w[show edit update]

  def index
    @experiments = Experiment.all

    check_click_percentages

  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
    if Experiment.create! experiment_params
      flash[:success] = "Experiment Created!"
      redirect_to experiments_path
    else
      flash[:danger] = "Something went wrong"
      render @experiment
    end
  end

  private

  def new_experiment
    @experiment = Experiment.new
  end

  def experiment_params
    params.require(:experiment).permit(:survey_link, :wait_interval_days)
  end

  def check_click_percentages
    @experiments.each do |experiment|
      if experiment.click_trackers.any?
        latest_updated_click_tracker = experiment.click_trackers.max_by(&:updated_at)

        if experiment.updated_at < latest_updated_click_tracker.updated_at
          experiment.recalculate_click_percentages
        end
      end
    end
  end
end
