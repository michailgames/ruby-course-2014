require_relative 'article.rb'

class MockArticle < Article
  WORD_LIST = ["legendary", "awesome", "wait", "for", "it", "brother",
               "story", "cool", "fox", "great", "white", "polar", "bear",
               "university", "such", "educating"]

  def initialize
    @author = generate_author
    @title = generate_title
    @content = generate_content
    @likes = random_number
    @dislikes = random_number
  end
               
  def random_number
    rand(101)
  end
  
  def generate_author
    WORD_LIST.sample.capitalize + " " + WORD_LIST.sample.capitalize
  end
  
  def generate_title
    n = rand(4)
    s = WORD_LIST.sample.capitalize 
    n.times do 
      s += " " + WORD_LIST.sample
    end
    s
  end
  
  def generate_sentence
    n = 4 + rand(5)
    s = WORD_LIST.sample.capitalize 
    n.times do 
      s += " " + WORD_LIST.sample
    end
    s + "."
  end
  
  def generate_content
    n = rand(4)
    s = generate_sentence 
    n.times do 
      s += " " + generate_sentence
    end
    s
  end
end
