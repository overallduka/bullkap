require 'spec_helper'


RSpec.describe PeopleController, :type => :controller do
  include Devise::TestHelpers

  let(:user) { FactoryGirl.create(:user) }
  let(:person) { FactoryGirl.create(:person) }
  let(:valid_attributes) { { name: 'Robert', email: 'sksao@saoks.com', cell_number: '7554324563', phone_number: '5434643225'} }
  let(:invalid_attributes) { { phone_number: '4344' } }


  describe "GET index" do
    it "assigns all people as @people" do
      sign_in user
      get :index, {}
      expect(assigns(:people)).to eq([person])
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      sign_in user
      get :show, {:id => person.to_param}
      expect(assigns(:person)).to eq(person)
    end
  end

  describe "GET new" do
    it "assigns a new person as @person" do
      sign_in user
      get :new, {}
      expect(assigns(:person)).to be_a_new(Person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      sign_in user
      get :edit, {:id => person.to_param}
      expect(assigns(:person)).to eq(person)
    end
  end

  describe "POST create" do
    before do
      sign_in user
    end 
    describe "with valid params" do
      it "creates a new Person" do
        expect {
          post :create, {:person => valid_attributes}
        }.to change(Person, :count).by(1)
      end

      it "assigns a newly created person as @person" do
        post :create, {:person => valid_attributes}
        expect(assigns(:person)).to be_a(Person)
        expect(assigns(:person)).to be_persisted
      end

      it "redirects to the created person" do
        post :create, {:person => valid_attributes}
        expect(response).to redirect_to(Person.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved person as @person" do
        post :create, { :person => invalid_attributes }
        expect(assigns(:person)).to be_a_new(Person)
      end

      it "re-renders the 'new' template" do
        post :create, {:person => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    before do
      sign_in user
    end
    describe "with valid params" do
      let(:new_attributes) { { name: 'Marcelo', 
                               email: 'sksao@saoks.com', 
                               cell_number: '7554324563', 
                               phone_number: '5434643225' } }

      it "updates the requested person" do
        put :update, { :id => person.id, :person => new_attributes }
        person.reload
        expect(person.name).to eq('Marcelo')
      end

      it "assigns the requested person as @person" do
        put :update, {:id => person.to_param, :person => valid_attributes}
        expect(assigns(:person)).to eq(person)
      end

      it "redirects to the person" do
        put :update, {:id => person.to_param, :person => valid_attributes}
        expect(response).to redirect_to(person)
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        put :update, {:id => person.to_param, :person => invalid_attributes}
        expect(assigns(:person)).to eq(person)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => person.to_param, :person => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    before do
      sign_in user
    end
    it "destroys the requested person" do
      
      expect {
        delete :destroy, {:id => person.id}
      }.to change(Person, :count).by(0)
    end

    it "redirects to the people list" do
      
      delete :destroy, {:id => person.id}
      expect(response).to redirect_to(people_url)
    end
  end

end
