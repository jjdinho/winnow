puts "Clearing database..."

NewsSource.destroy_all

american_news_sources_id_array = ["abc-news", "al-jazeera-english", "ars-technica",
                       "associated-press", "axios", "bleacher-report",
                       "bloomberg", "breitbart-news", "business-insider",
                       "buzzfeed", "cbs-news", "cnbc", "cnn", "crypto-coins-news",
                       "engadget", "entertainment-weekly", "espn", "espn-cric-info",
                       "fortune", "fox-news", "fox-sports", "google-news",
                       "hacker-news", "ign", "mashable", "medical-news-today",
                       "msnbc", "mtv-news", "national-geographic", "national-review",
                       "nbc-news", "new-scientist", "newsweek", "new-york-magazine",
                       "next-big-future", "nfl-news", "nhl-news", "politico",
                       "polygon", "recode", "reddit-r-all", "reuters", "techcrunch",
                       "techradar", "the-american-conservative", "the-hill",
                       "the-huffington-post", "the-new-york-times", "the-next-web",
                       "the-verge", "the-wall-street-journal", "the-washington-post",
                       "the-washington-times", "time", "usa-today", "vice-news", "wired"]

american_news_sources_name_array = ["ABC News", "Al Jazeera English", "Ars Technica", "Associated Press",
                  "Axios", "Bleacher Report", "Bloomberg", "Breitbart News",
                  "Business Insider", "Buzzfeed", "CBS News", "CNBC", "CNN",
                  "Crypto Coins News", "Engadget", "Entertainment Weekly", "ESPN",
                  "ESPN Cric Info", "Fortune", "Fox News", "Fox Sports", "Google News",
                  "Hacker News", "IGN", "Mashable", "Medical News Today", "MSNBC", "MTV News",
                  "National Geographic", "National Review", "NBC News", "New Scientist",
                  "Newsweek", "New York Magazine", "Next Big Future", "NFL News", "NHL News",
                  "Politico", "Polygon", "Recode", "Reddit /r/all", "Reuters", "TechCrunch",
                  "TechRadar", "The American Conservative", "The Hill", "The Huffington Post",
                  "The New York Times", "The Next Web", "The Verge", "The Wall Street Journal",
                  "The Washington Post", "The Washington Times", "Time", "USA Today", "Vice News",
                  "Wired"]

counter = 0

puts "Making American news sources..."

american_news_sources_id_array.each do |news_source_id|
  NewsSource.create!(id_tag: news_source_id, name: american_news_sources_name_array[counter])
  counter += 1
end

puts "Created #{NewsSource.count} american news sources."

User.create!(first_name: "Default", last_name: "User", email: "defaultuser@example.com", password: "password", password_confirmation: "password")

puts "Created default user"

