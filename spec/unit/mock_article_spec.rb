require_relative "../../mock_article"
require "minitest/autorun"
 
class MockArticleSpec < MiniTest::Test

  def setup
    @article = MockArticle.new
  end
  
  def test_random_number
    assert(@article.random_number.between?(0,100))
  end
end
