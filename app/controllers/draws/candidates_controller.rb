class Draws::CandidatesController < DrawsController

  before_filter :check_if_finished

  def index
    @candidate_draws = CandidateDraw.all
  end

  def edit
    @candidate_draw = CandidateDraw.find_by_id params[:id]
  end

  def update
    @draw = CandidateDraw.find_by_id params[:id]
    params[:candidate_drawing].sort{|x,y| x.last<=>y.last}.each do |id, value|
      drawing = @draw.candidate_drawings.find_by_id(id)
      drawing.update_attribute :position_in_draw_position, value
    end
    @draw.update_attribute :drawed, true
    redirect_to draws_candidates_path(:anchor => "draw_#{@draw.id}")
  end

  def ready
    REDIS.set('candidate_draw_status', true)
    redirect_to draws_candidates_path
  end

  private

  def check_if_finished
    if REDIS.get('candidate_draw_status')
      redirect_to draws_path
      return
    end
  end

end
