module TaskHelpers
  def self.fetch_data(url)
    base = 'https://pokeapi.co/api/v2'
    response = RestClient.get("#{base}/#{url}")
    JSON.parse(response)
  end

  def self.fetch_pokes
    results = fetch_data('pokemon?limit=151')['results']
    results.map.with_index do |poke, idx|
      { name: poke['name'],
        sprites: ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{idx + 1}.png",
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/#{
                    idx + 1}.gif"] }
    end
  end

  def self.fetch_abilities
    results = fetch_data('ability?limit=10')['results']
    results.map do |ability|
      { name: ability['name'],
        description: fetch_data("ability/#{ability['name']}").dig('effect_entries', 1, 'effect') }
    end
  end

  def self.fetch_types
    results = fetch_data('type')['results']
    results.map do |p_type|
      props = fetch_data("type/#{p_type['name']}")
      { name: p_type['name'],
        double_damage_from: extract_data(props.dig('damage_relations', 'double_damage_from')),
        double_damage_to: extract_data(props.dig('damage_relations', 'double_damage_to')),
        half_damage_from: extract_data(props.dig('damage_relations', 'half_damage_from')),
        half_damage_to: extract_data(props.dig('damage_relations', 'half_damage_to')),
        no_damage_from: extract_data(props.dig('damage_relations', 'no_damage_from')),
        no_damage_to: extract_data(props.dig('damage_relations', 'no_damage_to')) }
    end
  end

  def self.extract_data(data)
    data.each_with_object([]) do |hash, obj|
      hash.each do |point|
        obj << hash[point] if point == 'name'
      end
    end
  end
end
