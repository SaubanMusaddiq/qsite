class SearchController < ApplicationController

  require 'quran_search.rb'
  def search

    print "$$$$$$$$$$$$$$$$$$$$$$$$$", perform_search
    if perform_search
      render partial: 'results' #, layout: false if request.xhr?
    else
      render 'error' #, layout: false if request.xhr?
    end
  end

  # def suggestion
  #   if perform_suggest
  #     render layout: false
  #   else
  #     render 'suggestion_error', layout: false
  #   end
  # end

  protected

  def perform_search
    client = QuranSearch.new(query, page: page)

    begin
      @results = client.search
      # show_search_results(results)
    rescue Elasticsearch::Transport::Transport::ServerError => e
      false
    end
  end

  # def perform_suggest
  #   client = Search::QuranSearchClient.new(
  #     query,
  #     page: page, size: size, lanugage: language
  #   )
  #
  #   begin
  #     results = client.suggest
  #     @presenter = SearchPresenter.new(self)
  #     @presenter.add_search_results(results)
  #   rescue Faraday::ConnectionFailed => e
  #     false
  #   rescue Elasticsearch::Transport::Transport::ServerError => e
  #     # Index not ready yet? or other ES server errors
  #     false
  #   end
  # end

  def query
    query = (params[:q] || params[:query]).to_s.strip.first(150)
    params[:q] = query
  end

  def size(default = 20)
    (params[:size] || params[:s] || default).to_i
  end

  def page
    (params[:page] || params[:p]).to_i.abs
  end
end
