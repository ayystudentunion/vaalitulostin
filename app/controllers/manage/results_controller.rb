class Manage::ResultsController < ManageController
  respond_to :json

  def index
    @results = Result.for_listing
  end

  # The calculated format of the result is used for displaying a temporary result when executing the drawings.
  # It should be the only purpose (except for viewing the result in development environment).
  # Rendering the result view is *slow* and may result to request timeout. For any other production purposes,
  # use the file which is stored in S3.
  def show
    @result = ResultDecorator.decorate Result.find(params[:id])

    respond_to do |format|
      format.json { render :locals => {:result => @result} }
      format.html { render :partial => "result", :locals => { :result_decorator => @result} }
    end
  end

  def json
    @result = ResultDecorator.decorate Result.find(params[:result_id])

    respond_to do |format|
      format.json { render params[:target], :locals => {:result => @result} }
    end
  end

  def publish
    result_publisher = ResultPublisher.new(Result.find(params[:result_id]))

    if result_publisher.publish!
      flash[:notice] = "Vaalitulos jonossa julkaistavaksi."
    else
      flash[:error] = "Vaalituloksen julkaisu epäonnistui."
    end

    redirect_to manage_results_path
  end

end
