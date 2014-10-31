class ArticleFilesystem

  ARTICLES_FOLDER = './articles/'
  
  def self.write_to_file(article)
    filename = article.title.downcase.split.join("_")
    File.open(ARTICLES_FOLDER + filename, 'w') do |file|
      file.write("#{article.author}|#{article.title}|#{article.content}|" + \
                "#{article.likes}|#{article.dislikes}")
    end
  end
end
