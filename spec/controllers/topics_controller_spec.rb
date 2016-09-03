require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  
  describe "testing topic index page" do
        it "should render index" do
    
        get :index
        # I want to render the index.html.erb template
        expect(subject).to render_template(:index)
     end
   end
    
    describe "testing topic new page" do
          it "should render new" do
        
        get :new
        expect(subject).to render_template(:new)
     end
   end

    describe "testing topic create page" do
          it "should create new topic" do
        
            params = { topic: { title: "myTestTitle", description: "inside this double quotes needs 20 letters because I give validates description length to minimum 20 letters "} }
            post :create, params: params
        
            # expect(response).to render_template :create
            expect(flash[:success]).to eql("You've created a new topic.")
        end
    end
    
    describe "testing topic edit page" do
          it "should render edit page" do
            topic = Topic.create({
              title:       "This is a topic", 
              description: "This is a description"
            })
            params = { id: topic.id }
            get :edit, params: params
            expect(subject).to render_template(:edit)
        end
    end    
    
    describe "testing topic update page" do
          it "should update topic" do
        
            topic = Topic.create({
             title:       "This is a topic", 
             description: "This is a description"
            })
            params = {
            id: topic.id, 
            topic: { 
                    title: "myTestTitle", 
                    description: "inside here needs apply 20 letters because I give validates description length to minimum 20 letters "
            }}
            
            patch :update, params: params
            # expect(response).to render_template :create
            expect(flash[:success]).to eql("You've updated.")
        end
    end  
    
    describe "testing topic destroy page" do
          it "should destroy topic" do
        
            topic = Topic.create({
                    title:       "This is a topic", 
                    description: "This is a description"
            })
            params = {
                id: topic.id, 
                topic: { 
                    title: "myTestTitle", 
                    description: "inside here needs apply 20 letters because I give validates description length to minimum 20 letters "
            }}
            delete :destroy, params: params
            # expect(response).to render_template :create
            expect(flash[:success]).to eql("You've destroy.")
      end
    end
    
    
end
