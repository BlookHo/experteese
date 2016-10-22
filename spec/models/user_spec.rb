require 'rails_helper'

RSpec.describe User, type: :model do
   
  describe User do
    before { @user = User.new(name: "Example User", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar" ) }
    
    subject { @user }
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authenticate) }
    it { should respond_to(:remember_token) }

    it { should be_valid }

    describe "remember token"   do  # , focus: true
      before { @user.save }
      # its(:remember_token) { should_not be_blank }
      it { expect(@user.remember_token).not_to be_blank }

    end

    describe "Проверка того, что пароль - слишком короткий"   do # , focus: true
      before { @user.password = @user.password_confirmation = "a" * 6 }
      it { should be_invalid }
    end
    
    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by(email: @user.email) }
  
      describe "with valid password" do
        it { should eq found_user.authenticate(@user.password) }
      end
  
      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }
    
        it { should_not eq user_for_invalid_password }
        it "fgfg" do
          # puts " user_for_invalid_password = #{user_for_invalid_password}"
          expect(user_for_invalid_password).to eq(false)
        end
      end
    end

       
    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
       
  end
    
  describe "when email is not present" do
    # before { @user.email = " " }
    before { @user = User.new(name: "Example User", email: " ") }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    # before { @user.name = " " }
    before { @user = User.new(name: " ", email: "user@example.com") }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @user = User.new(name: "a" * 51, email: "user@example.com") }
    it { should_not be_valid }
  end
  describe "when email have more than one dot" do
    before { @user = User.new(name: "Example User", email: "user@ex.ample.com") }
    it { should_not be_valid }
  end
  describe "when email have more than one dot" do
    before { @user = User.new(name: "Example User", email: "u.ser@example.com") }
    it { should_not be_valid }
  end

  describe "check emails format" do
    
    before { @user = User.new(name: "Example User2", email: "user@example.com",
                              password: "foobar", password_confirmation: "foobar" ) }
    subject { @user }
    
    describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end
  
    describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end

    describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end
      it { should_not be_valid }
    end

    describe "email address with mixed case" do
      let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
  
      it "should be saved as all lower-case" do
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq mixed_case_email.downcase
      end
    end

  end

end
