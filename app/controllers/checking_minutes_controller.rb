class CheckingMinutesController < ApplicationController

  before_filter :authorize_minutes

  def index
    @voting_areas = VotingArea.all
  end

  def show
    @candidates = Candidate.all
    @voting_area = VotingArea.find_by_id params[:id]
  end

  private

  def authorize_minutes
    authorize! :minutes, @current_admin_user
  end

end
