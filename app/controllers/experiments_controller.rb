class ExperimentsController < ApplicationController
  before_action :new_experiment,  only: %w[new]
  before_action :find_experiment, only: %w[show edit update]

  def index
    @experiments = Experiment.all
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
end
