require 'spec_helper'

describe User do
  before {@user = User.new(name: "Test User", email: "user@example.com")}

  subject{ @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end
