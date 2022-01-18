class RenamePictureToSpritesInPokeData < ActiveRecord::Migration[6.1]
  def change
    rename_column :poke_data, :picture, :sprites
  end
end
