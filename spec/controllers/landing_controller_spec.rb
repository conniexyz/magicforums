 require 'rails_helper'

  RSpec.describe LandingController, type: :controller do
  
   describe "testing landing page" do
    it "should render index" do
        
        get :index
        # I want to render the index.html.erb template
        expect(subject).to render_template(:index)
    end
   end
  end