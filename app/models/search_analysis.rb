class SearchAnalysis < ApplicationRecord
  enum :engine, { google: 0, bing: 1, duckduckgo: 2, yahoo: 3, yandex: 4, baidu: 5 }
  enum :status, { pending_search: 0, pending_chat: 1, complete: 2, failed: 3 }
  
  validates :query, presence: true
  validates :engine, presence: true
  validates :prompt, presence: true

  after_create :run_search, :run_chat

  def run_search
    return unless self.status == "pending_search"

    search_response = SerpApiServices::SearchService.new(self).call
    
    if search_response.success?
      self.search_results = search_response.results
      self.status = "pending_chat"
    else
      self.search_results = "Failed due to error: #{search_response.error.to_s}"
      self.status = "failed"
    end
    self.save
  end

  def run_chat
    return unless self.status == "pending_chat"

    chat_response = OpenAIServices::ChatService.new(self).call
    
    if chat_response.success?
      self.chat_response = chat_response.results
      self.status = "complete"
    else
      self.chat_response = "Failed due to error: #{chat_response.error.to_s}"
      self.status = "failed"
    end
    self.save
  end
end
