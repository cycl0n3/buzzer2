json.extract! article, :id, :title, :created_at, :updated_at
json.show_url article_url(article)
json.edit_url edit_article_url(article)
