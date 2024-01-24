module OpenAIServices
  class ChatService
    attr_reader :search_analysis
    
    def initialize(search_analysis)
      @search_analysis = search_analysis
    end
    
    def call
      begin
        client = OpenAI::Client.new
        response = client.chat(
          parameters: {
              model: "gpt-3.5-turbo",
              messages: [{ role: "user", content: generate_prompt}],
              temperature: 0,
          })
        chat_response = response.dig("choices", 0, "message", "content")
      rescue StandardError => e
        OpenStruct.new(success?: false, error: e)
      else
        OpenStruct.new({success?: true, results: chat_response})
      end
    end
    
    private
    
      def generate_prompt
        <<~PROMPT
          #{@search_analysis.prompt}

          My search query: #{@search_analysis.query}"

          The search results were:
          #{@search_analysis.search_results}
        PROMPT
      end
  end
end