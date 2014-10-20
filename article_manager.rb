class ArticleManager

  def initialize
    @articles = []
  end
  
  def add(article)
    @articles << article
  end
  
  def worst_articles
    @articles.sort_by { |x| x.positive_votes }
  end
  
  def best_articles
    @articles.sort_by { |x| -x.positive_votes}
  end
  
  def worst_article
    @articles.min_by { |x| x.positive_votes }
  end
  
  def best_article
    @articles.max_by { |x| x.positive_votes }
  end
  
  def most_popular_article
    @articles.max_by { |x| x.votes }
  end
  
  def include?(pattern)
    @articles.select { |x| x.include?(pattern) }
  end
  
  def authors
    (@articles.inject([]) { |ys, x| ys << x.author }).uniq
  end
  
  def number_of_authors
    authors.size
  end
  
  def votes
    @articles.inject(0) { |sum, x| sum += x.votes }
  end
  
  def to_s
    s = "["
    @articles.each_with_index do |x, i|
      s += ", " if i != 0
      s += "(" + x.author + ", " + x.title + ")"
    end
    s + "]"
  end
end
