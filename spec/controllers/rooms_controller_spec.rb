RSpec.describe RoomsController, type: :controller do
  context "requests" do     
    describe "GET index" do
      it “returns a successful response” do
        get :index
        expect(response).to be_successful
      end
   
    #   it "assigns @users" do
    #     user = User.create(name: “Test user”)
    #     get :index
    #     expect(assigns(:users)).to eq([user])
    #   end
  
    #   it "renders the index template" do
    #     get :index
    #     expect(response).to render_template("index")
    #   end
    end
  end
end