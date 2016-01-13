require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create(email: "admin@blocitoff.com", password: "password", password_confirmation: "password") }


  context "signed in user" do
    describe "GET #show" do
      before do
        user.confirm
        sign_in user
      end

      it "returns http success" do
        # sign_in(user)
        # '/users/1'
        get :show, id: user.id
        # byebug
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        # sign_in user
        get :show, {id: user.id}
        expect(response).to render_template :show
      end
    end
  end

  context "no current user" do

    describe "GET #show" do

      it "returns http 302" do
        get :show, id: user.id
        expect(response).to have_http_status(302)
      end

      it "redirects back to sign in" do
        get :show, id: user.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
