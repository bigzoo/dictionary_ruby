require('rspec')
require('dictionary')
require('pry')

describe('Word') do
  before do
    Word.clear
  end
  describe('.all') do
    it('dictionary of words is empty at first') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a new word into the dictionary.') do
      kuku = Word.new(word: 'kuku')
      kuku.save
      expect(Word.all).to(eq([kuku]))
    end
  end

  describe('.find') do
    it('returns a word using only the id no of the word') do
      kuku = Word.new(word: 'kuku')
      kuku.save
      def1 = Definition.new(definition: 'A kuku is a female chicken.')
      def2 = Definition.new(definition: 'A chicken is a female kuku.')
      kuku.add_definition(def1)
      kuku.add_definition(def2)
      expect(Word.find(1)).to(eq(kuku))
    end
  end
end

describe('Dictionary') do
  before do
    Definition.clear
  end
  describe('.all') do
    it('dictionary of definitions is empty at first') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#add_definition') do
    it('saves a new definition into a specific word in the dictionary.') do
      kuku = Word.new(word: 'kuku')
      kuku.save
      def1 = Definition.new(definition: 'A chicken is a female kuku.')
      kuku.add_definition(def1)
      expect(kuku.definitions).to(eq([def1]))
    end
  end

  describe('#add_definition') do
    it('saves a new definition into a specific word in the dictionary.') do
      kuku = Word.new(word: 'kuku')
      kuku.save
      kuku.add_definition('A kuku is a female chicken.')
      ngombe = Word.new(word: 'ngombe')
      ngombe.save
      def1 = Definition.new(definition: 'A ngombe is a female cow.')
      ngombe.add_definition(def1)
      expect(ngombe.definitions).to(eq([def1]))
    end
  end

  describe('.all') do
    it('returns all definitions in the dictionary') do
      kuku = Word.new(word: 'kuku')
      kuku.save
      def1 = Definition.new(definition: 'A kuku is a female chicken.')
      def1.save_def
      def2 = Definition.new(definition: 'A chicken is a female kuku.')
      def2.save_def
      kuku.add_definition(def1)
      kuku.add_definition(def2)
      expect(Definition.all).to(eq(kuku.definitions))
    end
  end
end
