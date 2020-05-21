class CreatePetlistings < ActiveRecord::Migration[5.2]
  def change
    create_table :petlistings do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
