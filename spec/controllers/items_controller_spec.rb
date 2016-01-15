require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "POST #create" do
    it "redirects to user#show page" do
      get :create
      expect(response).to redirect_to(user_show_path)
    end
  end

end
