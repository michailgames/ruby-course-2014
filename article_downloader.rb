require_relative 'article'
require 'nokogiri'
require 'open-uri'
require 'openssl'

class ArticleDownloader
  URL = 'https://zapisy.ii.uni.wroc.pl/news/'

  def self.download_articles
    html_doc = Nokogiri::HTML(open(URL, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }))
    parse_articles(html_doc)
  end

  def self.parse_articles(html)
    article_divs = html.css("div.od-news-item")
    article_divs.map { |article_div| parse_article(article_div) }
  end

  def self.parse_article(div)
    title = div.css("div.od-news-header h3").text
    content = div.css("div.od-news-body").text
    author = div.css("div.od-news-footer").text.strip
    Article.new(title, content, author)
  end
end