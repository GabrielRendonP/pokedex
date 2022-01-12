class CreatePokeTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :poke_types do |t|
      t.string :name

      t.timestamps
    end
  end
end