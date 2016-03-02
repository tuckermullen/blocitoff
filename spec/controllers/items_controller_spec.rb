require 'rails_helper'
RSpec.describe ItemsController, type: :controller do
  let(:user) { User.create!(email: "user@bloccit.io", password: "helloworld") }


  describe "POST create" do
    it "redirect to show page" do
      post :create, user_id: user, item: { name: "name"}
      expect(response).to redirect_to root_path
    end
  end
end
