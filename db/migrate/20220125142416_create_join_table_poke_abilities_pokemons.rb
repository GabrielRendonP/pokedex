class CreateJoinTablePokeAbilitiesPokemons < ActiveRecord::Migration[6.1]
  def change
    create_join_table :poke_abilities, :pokemons do |t|
      t.index [:poke_ability_id, :pokemon_id]
      # t.index [:pokemon_id, :poke_ability_id]
    end
  end
end
