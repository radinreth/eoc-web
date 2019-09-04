class SopHighlight
  def initialize(search_highlight)
    @search_highlight = search_highlight
  end

  def id
    @search_highlight['_id']
  end

  def file_url
    @search_highlight['_source']['file']['url']
  end

  def category_id
    @search_highlight['_source']['category_id']
  end

  def category_name
    @search_highlight['_source']['category_name']
  end

  def name
   if @search_highlight['highlight'] && @search_highlight['highlight']['name']
     @search_highlight['highlight']['name'].first
   elsif @search_highlight['_source']['name']
     @search_highlight['_source']['name']
   else
     ''
   end
  end

  def tags
   if @search_highlight['highlight'] && @search_highlight['highlight']['tags']
     @search_highlight['highlight']['tags'].first
   else
    @search_highlight['_source']['tags']
   end
  end
end
