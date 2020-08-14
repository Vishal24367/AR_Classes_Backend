class CreateArClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :ar_classes do |t|
      t.string        :name,                         index: true
      t.integer       :strength
      t.references    :organization, index: true, foreign_key: true
      t.references    :department, index: true, foreign_key: true
      t.timestamps
    end
  end
end
