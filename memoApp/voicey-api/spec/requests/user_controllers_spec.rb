require 'rails_helper'

RSpec.describe "UserControllers", type: :request do
  # for authentication
  describe "GET /user_controllers" do
    context "unauthorized" do
      before {
        get "/users"
      }

      it "fails when there's no authentication" do
        expect(response).to_not be_success
      end
    end

    context "authorized" do
      before {
        user = User.new(
          name: "sky",
          email: "sky@test.com",
          password: test
        )
        user.save

        # create token for request
        full_token = "Token token=#{user.token}"
        get "/users", headers: {'Authorization' => full_token}
      }

      it "success when there's authentication" do
        expect(response).to be_success
      end

    end
  end

  # for sign up
  describe "POST /user_controllers" do
    # for valid params
    context "valid params" do
      before {
        valid_params = {name: "sky", email: "sky@test.com", password: "test"}
        post "/users", paramsd: valid_params
      }

      it "creates user with valid params and send success" do
        expect(response).to be_success
      end
    end

    # for invalid params
    context "invalid params" do
      before {
        invalid_params = {email: "eliel@test.com", password: "testpassword"}
        post "/users", params: invalid_params
      }

      it "should fail and send 400" do
        expect(response).to_not be_success
      end
    end

  end
end
