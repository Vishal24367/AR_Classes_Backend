class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :topic_name
      t.integer :duration
      t.string :video_link
      t.references    :ar_class, index: true, foreign_key: true
      t.references    :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
