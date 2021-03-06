class PublishResultJob

  attr_accessor :result_id

  def initialize(result_id)
    self.result_id = result_id
  end

  def perform
    Rails.logger.info "Publishing a previously created result."

    ResultPublisher
      .new(Result.find(result_id))
      .store_and_make_public!
  end

end
