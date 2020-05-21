class AddSpeciesToPetlisting < ActiveRecord::Migration[5.2]
  def change
    add_reference :petlistings, :species, foreign_key: true
  end
end
