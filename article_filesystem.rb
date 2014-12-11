require_relative 'article'

class ArticleFilesystem

  ARTICLES_FOLDER = './articles/'
  
  def self.write_to_file(article)
    filename = article.title.downcase.split.join("_").gsub("/", "_")
    File.open(ARTICLES_FOLDER + filename, 'w') do |file|
      file.write("#{article.author}|#{article.title}|#{article.content}|" + \
                "#{article.likes}|#{article.dislikes}")
    end
  end
  
  def self.read_article(filepath)
    File.open(filepath, 'r') do |file|
      author, title, content, likes, dislikes = file.gets.split("|")
      Article.new(author, title, content, likes.to_i, dislikes.to_i)
    end
  end
end
