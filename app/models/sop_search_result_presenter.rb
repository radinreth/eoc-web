class SopSearchResultPresenter
  attr_accessor :response

  def initialize(response)
    @response = response
  end

  def total
    @response["hits"]["total"]
  end

  def results
    @results ||= @response.results
  end
end
