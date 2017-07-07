class Word
  @@words = []
  attr_reader(:word, :id, :definitions)

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

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each do |word|
      found_word = word if word.id.eql?(id)
    end
    found_word
  end

  define_singleton_method(:clear) do
    @@words = []
  end
end

class Definition
  @@definitions = []
  attr_reader(:definition, :id)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length.+(1)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each do |definition|
      found_definition = definition if definition.id.eql?(id)
    end
    found_definition
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_method(:save_def) do
    @@definitions.push(self)
  end
end
