class Analysis
  def initialize(letter_distribution)
    @letter_distribution = letter_distribution
  end

  def perform
    results = `python lib/language_process/script.py 'en' '#{@letter_distribution.original_sentence}'`
    json = MultiJson.load(results)
    @letter_distribution.update_attribute(:data, json)
  end
end
