require_relative "../../article"
require "minitest/autorun"
 
class TestArticle < MiniTest::Test

  def setup
    @article = Article.new("Some Title", "Some content content", "Some Author")
  end
 
  def test_initialize
    assert_equal("Some Title", @article.title)
    assert_equal("Some content content", @article.content)
    assert_equal("Some Author", @article.author)
    assert_equal(0, @article.likes)
    assert_equal(0, @article.dislikes)
    assert_equal(Time, @article.created_at.class)
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
    text = "con"
    assert_equal(@article.content.include?(text), @article.include?(text))
    text = "blah blah blah"
    assert_equal(@article.content.include?(text), @article.include?(text))
  end
  
  def test_words
    assert_equal(["Some", "content", "content"], @article.words)
  end
  
  def test_distinct_words
    assert_equal(["some", "content"], @article.distinct_words)
  end 
end
