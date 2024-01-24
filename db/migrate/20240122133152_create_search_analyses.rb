class CreateSearchAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :search_analyses do |t|
      t.text :query
      t.integer :engine
      t.text :prompt
      t.text :search_results
      t.text :chat_response
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
