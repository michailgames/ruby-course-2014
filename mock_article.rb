require_relative 'article.rb'
require 'bla-bla'

class MockArticle < Article
  def initialize
    super(BlaBla.title, BlaBla.content, BlaBla.author)
    @likes = random_number
    @dislikes = random_number
  end
               
  def random_number
    rand(101)
  end
end
