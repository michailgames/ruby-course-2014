class Article
  attr_reader :title
  attr_reader :content
  attr_reader :author
  attr_reader :created_at
  
  def initialize(title, content, author="")
    @title, @content, @author = title, content, author
    @likes = @dislikes = 0
    @created_at = Time.now
  end
  
  def like!
    @likes += 1
  end
  
  def dislike!
    @dislikes += 1
  end
  
  def positive_votes
    @likes - @dislikes
  end
  
  def votes
    @likes + @dislikes
  end
  
  def shortened_to(limit)
    if @content.size <= limit
      @content
    else 
      @content[0, (limit >= 3 ? limit - 3 : 0)] + "..."
    end
  end
  
  def include?(text)
    @content.include?(text)
  end
  
  def words
    @content.split(/\W+/)
  end
  
  def distinct_words
    (words.map { |w| w.downcase }).uniq
  end
end
