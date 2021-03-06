require "rails_helper"

RSpec.describe ApplicationFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/application_forms").to route_to("application_forms#index")
    end

    it "routes to #new" do
      expect(:get => "/application_forms/new").to route_to("application_forms#new")
    end

    it "routes to #show" do
      expect(:get => "/application_forms/1").to route_to("application_forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/application_forms/1/edit").to route_to("application_forms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/application_forms").to route_to("application_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/application_forms/1").to route_to("application_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/application_forms/1").to route_to("application_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/application_forms/1").to route_to("application_forms#destroy", :id => "1")
    end

  end
end
