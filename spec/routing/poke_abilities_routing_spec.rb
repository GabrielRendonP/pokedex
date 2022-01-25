require "rails_helper"

RSpec.describe PokeAbilitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/poke_abilities").to route_to("poke_abilities#index")
    end

    it "routes to #new" do
      expect(get: "/poke_abilities/new").to route_to("poke_abilities#new")
    end

    it "routes to #show" do
      expect(get: "/poke_abilities/1").to route_to("poke_abilities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/poke_abilities/1/edit").to route_to("poke_abilities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/poke_abilities").to route_to("poke_abilities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/poke_abilities/1").to route_to("poke_abilities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/poke_abilities/1").to route_to("poke_abilities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/poke_abilities/1").to route_to("poke_abilities#destroy", id: "1")
    end
  end
end
