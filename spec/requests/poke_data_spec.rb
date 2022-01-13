 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/poke_data", type: :request do
  
  # PokeDatum. As you add validations to PokeDatum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      PokeDatum.create! valid_attributes
      get poke_data_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      poke_datum = PokeDatum.create! valid_attributes
      get poke_datum_url(poke_datum)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_poke_datum_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      poke_datum = PokeDatum.create! valid_attributes
      get edit_poke_datum_url(poke_datum)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PokeDatum" do
        expect {
          post poke_data_url, params: { poke_datum: valid_attributes }
        }.to change(PokeDatum, :count).by(1)
      end

      it "redirects to the created poke_datum" do
        post poke_data_url, params: { poke_datum: valid_attributes }
        expect(response).to redirect_to(poke_datum_url(PokeDatum.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PokeDatum" do
        expect {
          post poke_data_url, params: { poke_datum: invalid_attributes }
        }.to change(PokeDatum, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post poke_data_url, params: { poke_datum: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested poke_datum" do
        poke_datum = PokeDatum.create! valid_attributes
        patch poke_datum_url(poke_datum), params: { poke_datum: new_attributes }
        poke_datum.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the poke_datum" do
        poke_datum = PokeDatum.create! valid_attributes
        patch poke_datum_url(poke_datum), params: { poke_datum: new_attributes }
        poke_datum.reload
        expect(response).to redirect_to(poke_datum_url(poke_datum))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        poke_datum = PokeDatum.create! valid_attributes
        patch poke_datum_url(poke_datum), params: { poke_datum: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested poke_datum" do
      poke_datum = PokeDatum.create! valid_attributes
      expect {
        delete poke_datum_url(poke_datum)
      }.to change(PokeDatum, :count).by(-1)
    end

    it "redirects to the poke_data list" do
      poke_datum = PokeDatum.create! valid_attributes
      delete poke_datum_url(poke_datum)
      expect(response).to redirect_to(poke_data_url)
    end
  end
end