class CreateJoinTablePokemonsAbilities < ActiveRecord::Migration[6.1]
  def change
    create_join_table :pokemons, :abilities do |t|
      t.index [:pokemon_id, :ability_id]
    end
  end
end
