require_relative "../../article"
require "minitest/autorun"
 
class ArticleSpec < MiniTest::Test

  def setup
    @article = Article.new("Some Title", "Some content content", "Some Author")
  end
 
  def test_initialize
    assert_equal("Some Title", @article.title)
    assert_equal("Some content content", @article.content)
    assert_equal("Some Author", @article.author)
    assert_equal(0, @article.likes)
    assert_equal(0, @article.dislikes)
  end
  
  def test_like
    previous_likes = @article.likes
    @article.like!
    assert_equal(previous_likes + 1, @article.likes)
  end
  
  def test_dislike
    previous_dislikes = @article.dislikes
    @article.dislike!
    assert_equal(previous_dislikes + 1, @article.dislikes)
  end
  
  def test_positive_votes
    @article.like!
    @article.dislike!
    @article.dislike!
    assert_equal(@article.likes - @article.dislikes, @article.positive_votes)
  end
  
  def test_votes
    @article.like!
    @article.dislike!
    assert_equal(@article.likes + @article.dislikes, @article.votes)
  end
  
  def test_shortened_to
    assert_equal("...", @article.shortened_to(3))
    assert_equal("Some con...", @article.shortened_to(11))
    assert_equal("Some content content", @article.shortened_to(20))
    assert_equal("Some content content", @article.shortened_to(21))
  end
  
  def test_include
    assert_equal(@article.content.include?("con"), @article.include?("con"))
    assert_equal(@article.content.include?("not included text"),
                 @article.include?("not included text"))
  end
  
  def test_words
    assert_equal(["Some", "content", "content"], @article.words)
  end
  
  def test_distinct_words
    assert_equal(["some", "content"], @article.distinct_words)
  end
  
  def test_created_stamp
    @article.instance_variable_set(:@created_at, Time.new(2014, 11, 13))
    assert_equal(@article.created_stamp, "Thursday, November 13, 2014")
    @article.instance_variable_set(:@created_at, Time.new(2012, 8, 18))
    assert_equal(@article.created_stamp, "Saturday, August 18, 2012")
  end
end
