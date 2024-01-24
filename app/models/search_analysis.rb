class SearchAnalysis < ApplicationRecord
  enum :engine, { google: 0, bing: 1, duckduckgo: 2, yahoo: 3, yandex: 4, baidu: 5 }
end
