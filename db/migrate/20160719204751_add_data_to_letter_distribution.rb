class AddDataToLetterDistribution < ActiveRecord::Migration[5.0]
  def change
    change_table :letter_distributions do |t|
      t.json :data, allow_nil: true
    end
  end
end
