require 'tokenizer'
require 'csv'

class Profano
  def self.initialize()

    @profaneWords = ''
    @cleanContent = true

  end
  def self.loadProfaneWords(filePath)
    @profaneWords = CSV.read(filePath)
    return @profaneWords
  end

  def self.profaneWordsFilter(content)
    @cleanContent = true
    @tokenizer = Tokenizer::WhitespaceTokenizer.new
    @content = content.to_s
    @tokenizedContent = @tokenizer.tokenize(@content)
    @tokenizedContent.each do |word|
      if @profaneWords.include?([word])
        @cleanContent = false
      end
    end
    return @cleanContent
  end


end