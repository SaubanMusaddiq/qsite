class QuranSearch

  VERSES_PER_PAGE = 20

  def initialize(query, options = {})
    @query = query
    @options = options
    @page = options[:page].to_i.abs
  end


  def search
    results = Translation.search(search_defination)
    print "DEFFFFFF$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",results.size

    if results.empty?
      # Search::NavigationClient.new(query.query).search
      {}
    else
      # Search::Results.new(results, page)
      results
    end
  end

  # def suggest
  #   results = Verse.search(search_defination(100, 10))
  #
  #   # For debugging, copy the query and paste in kibana for debugging
  #   #File.open("last_suggest_query.json", "wb") do |f|
  #   #  f << search_defination.to_json
  #   #end
  #
  #   if results.empty?
  #     Search::NavigationClient.new(query.query).search
  #   else
  #     Search::Results.new(results, page)
  #   end
  # end

  protected

  def search_defination(result_size = VERSES_PER_PAGE)
    {
      _source: source_attributes,
      query: search_query,
      # highlight: highlight(highlight_size),
      from: @page * result_size,
      size: result_size
    }
  end

  def source_attributes
    ['id', 'chapter_id'].freeze
  end

  def search_query()
    {
      bool: {
          must: [
          {
            multi_match: {
              query: @query,
              fields: [:content]
            }
          }
          ]
        }
      }
  end

end
