require_relative "../../mock_article"
require "minitest/autorun"
 
class TestMockArticle < MiniTest::Test

  def setup
    @article = MockArticle.new
  end
  
  def test_initialize
    _test_title(@article.title)
    _test_author(@article.author)
    _test_content(@article.content)
    _test_random_number(@article.likes)
    _test_random_number(@article.dislikes)
  end
  
  def _test_random_number(n)
   assert(n.between?(0, 100))
  end
  
  def test_random_number
    _test_random_number(@article.random_number)
  end
  
  def _test_author(author)
    name_parts = author.split
    assert_equal(2, name_parts.size)
    name_parts.each do |name_part|
      assert_equal(name_part, name_part.capitalize)
    end
  end
  
  def test_generate_author
    _test_author(@article.generate_author)
  end
  
  def _test_title(title)
    title_parts = title.split
    assert(title_parts.size.between?(1, 5)) 
    assert_equal(title_parts.first, title_parts.first.capitalize)
  end
  
  def test_generate_title
    _test_title(@article.generate_title)
  end
  
  def _test_sentence(sentence)
    words = sentence.split
    assert(words.size.between?(4, 9))
    assert_equal(words.first, words.first.capitalize)
    assert_equal(sentence.chars.last, ".")
  end
  
  def test_generate_sentence
    _test_sentence(@article.generate_sentence)
  end
  
  def _test_content(content)
    sentences = content.split(/(?<=\. )/)
    assert(sentences.size.between?(1, 5)) 
    sentences.each do |sentence|
      _test_sentence(sentence.strip)
    end
  end
  
  def test_generate_content
    _test_content(@article.generate_content)
  end 
end
