class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_no
      t.references    :organization, index: true, foreign_key: true
      t.references    :department, index: true, foreign_key: true
      t.references    :ar_class, index: true, foreign_key: true
      t.timestamps
    end
  end
end
