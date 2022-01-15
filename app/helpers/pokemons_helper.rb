module PokemonsHelper
  def picture(pokemon)
    pokemon.sprites[0]
  end

  def animation(pokemon)
    pokemon.sprites[1]
  end

  def type_badge(view_context, name)
    view_context.content_tag :span, name, class: "badge-#{name}"
  end

  def random_badge(view_context, name)
    view_context.content_tag :span, name, class: "badge-#{%w[blue yellow red green].sample}"
  end
end
