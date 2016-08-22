# coding: UTF-8
class Draws::CoalitionsController < DrawsController

  before_filter :check_if_finished

  def index
    @coalition_draws = CoalitionDraw.order('id').all
  end

  def edit
    @coalition_draw = CoalitionDraw.find_by_id params[:id]
  end

  def update
    @draw = CoalitionDraw.find_by_id params[:id]
    params[:coalition_drawing].sort{|x,y| x.last<=>y.last}.each do |id, value|
      drawing = @draw.coalition_drawings.find_by_id(id)
      drawing.update_attribute :position_in_draw_position, value
    end
    @draw.update_attribute :drawed, true
    redirect_to draws_coalitions_path(:anchor => "draw_#{@draw.id}")
  end

  def ready
    if CoalitionDraw.count == CoalitionDraw.ready.count
      REDIS.set('coalition_draw_status', true)
      redirect_to draws_coalitions_path
    else
      redirect_to draws_coalitions_path, alert: 'Kaikkia arvontoja ei ole vielä suoritettu'
    end
  end

  private

  def check_if_finished
    if REDIS.get('coalition_draw_status')
      redirect_to draws_path
      return
    end
  end

end
