require 'rails_helper'
 
RSpec.describe PostsController, type: :controller do

  describe "testing post index page" do
    it "should render index" do
      topic = Topic.create({
            title: "This is a post", 
            description: "inside this double quotes needs 20 letters because I give validates description length to minimum 20 letters"
          })
            index_params = {topic_id: topic.id}
            get :index, {params: index_params}
            expect(subject).to render_template(:index)
        end
      end


  describe "testing new post page" do
    it "should render new post page" do
      topic = Topic.create({
            title: "This is a post", 
            description: "inside this double quotes needs 20 letters because I give validates description length to minimum 20 letters"
          })
      new_params = {topic_id: topic.id}
      get :new, { params: new_params }
      # I want to render the new.html.erb template
      expect(subject).to render_template(:new)
    end
  end
      
   describe "testing post create page" do
     it "should render create post" do
        
       topic = Topic.create({
              title: "myTestTitle", 
              description:  "inside here needs apply 20 letters because I give validates description length to minimum 20 letters "
            })
              create_params = {topic_id: topic.id }
              post :create, {params: create_params}
              # expect(response).to render_template :create
              expect(flash[:success]).to eql("You've created a new post.")
      end
    end

end