json.extract! search_analysis, :id, :query, :engine, :prompt, :search_results, :chat_response, :created_at, :updated_at
json.url search_analysis_url(search_analysis, format: :json)
