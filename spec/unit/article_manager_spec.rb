require_relative "../../article"
require_relative "../../article_manager"
require "minitest/autorun"
 
class TestArticleManager < MiniTest::Test

  def setup
    @article1 = Article.new("Title1", "content1", "Author1")
    @article2 = Article.new("Title2", "content2", "Author2")
    @article3 = Article.new("Title3", "content3", "Author1")
    @manager = ArticleManager.new
    [@article1, @article2, @article3].each do |article|
      @manager.add(article)
    end
  end
  
  def test_worst_articles
    @article2.like!
    @article3.dislike!
    assert_equal([@article3, @article1, @article2], @manager.worst_articles)
  end
  
  def test_best_articles
    @article2.like!
    @article3.dislike!
    assert_equal([@article2, @article1, @article3], @manager.best_articles)
  end
  
  def test_worst_article
    @article2.dislike!
    assert_equal(@article2, @manager.worst_article)
  end
  
  def test_best_article
    @article3.like!
    assert_equal(@article3, @manager.best_article)
  end
  
  def test_most_popular_article
    @article1.like!
    @article1.dislike!
    @article2.like!
    @article3.dislike!
    assert_equal(@article1, @manager.most_popular_article)
  end
  
  def test_include
    assert_equal([], @manager.include?("some not matching text"))
    assert_equal([@article1, @article2, @article3],
        @manager.include?("content"))
    assert_equal([@article2], @manager.include?("2"))
  end
  
  def test_authors
    assert_equal(["Author1", "Author2"], @manager.authors)
  end
  
  def test_number_of_authors
    assert_equal(2, @manager.number_of_authors)
  end
  
  def test_votes
    @article1.like!
    @article1.dislike!
    @article2.like!
    @article3.dislike!
    assert_equal(4, @manager.votes)
  end
  
  def test_to_s
    assert_equal("[(Author1, Title1), (Author2, Title2), (Author1, Title3)]",
        @manager.to_s)
  end
end
