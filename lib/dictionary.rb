class Word
  @@words = []
  attr_reader(:word)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words.length.+(1)
    @definitions = []
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end
end

class Definition
  @@definitions = []
  attr_reader(:definition)

  define_method(:initialize) do |_definition|
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length.+(1)
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
