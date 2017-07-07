require('rspec')
require('dictionary')

describe('Word') do
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
end

describe('Dictionary') do
  describe('.all') do
    it('dictionary of definitions is empty at first') do
      expect(Definition.all).to(eq([]))
    end
  end
  #
  # describe('#save') do
  #   it('saves a new word into the dictionary.') do
  #     kuku = Word.new(word: 'kuku')
  #     kuku.save
  #     expect(Word.all).to(eq([kuku]))
  #   end
  # end
end
