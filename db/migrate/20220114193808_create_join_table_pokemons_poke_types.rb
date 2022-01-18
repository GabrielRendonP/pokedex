class CreateJoinTablePokemonsPokeTypes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :pokemons, :poke_types do |t|
      t.index [:pokemon_id, :poke_type_id]
    end
  end
end
