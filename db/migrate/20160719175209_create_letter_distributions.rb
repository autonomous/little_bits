class CreateLetterDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :letter_distributions do |t|
      t.text :original_sentence
      t.string :language
      t.timestamps
    end
  end
end
