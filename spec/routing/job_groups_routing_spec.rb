require "rails_helper"

RSpec.describe JobGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/job_groups").to route_to("job_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/job_groups/new").to route_to("job_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/job_groups/1").to route_to("job_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/job_groups/1/edit").to route_to("job_groups#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/job_groups").to route_to("job_groups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/job_groups/1").to route_to("job_groups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/job_groups/1").to route_to("job_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/job_groups/1").to route_to("job_groups#destroy", :id => "1")
    end
  end
end
