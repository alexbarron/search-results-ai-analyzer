module SerpApiServices
  class SearchService
    attr_reader :search_analysis
    
    def initialize(search_analysis)
      @search_analysis = search_analysis
    end
    
    def call
      begin
        search = SerpApiSearch.new(
          q: @search_analysis.query, 
          engine: @search_analysis.engine
        )
        text_results = textify_results(search.get_hash[:organic_results])
      rescue StandardError => e
        OpenStruct.new(success?: false, error: e)
      else
        OpenStruct.new({success?: true, results: text_results})
      end
    end

  private

    def textify_results(results)
      concatenated_text = ""

      results.each do |result|
        concatenated_text += "Title: #{result[:title]}\n"
        concatenated_text += "Link: #{result[:link]}\n"
        concatenated_text += "Snippet: #{result[:snippet]}\n\n"
      end

      return concatenated_text
    end
  end
end