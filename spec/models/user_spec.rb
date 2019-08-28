require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    subject { user }

    let(:user) do
      User.new(name: 'Example User',
               email: 'user@example.com',
               password: 'foobar',
               password_confirmation: 'foobar')
    end

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password_digest) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:password_confirmation) }
    it { is_expected.to respond_to(:authenticate) }
    it { is_expected.to respond_to(:remember_token) }

    it { is_expected.to be_valid }

    describe 'remember token' do
      before { user.save }

      it { expect(user.remember_token).not_to be_blank }
    end

    describe 'wnen password is too short - less then 6 symbols' do
      before { user.password = user.password_confirmation = 'a' * 5 }

      it { is_expected.to be_invalid }
    end

    describe 'return value of authenticate method' do
      before { user.save }

      let(:found_user) { User.find_by(email: user.email) }
      let(:user_for_invalid_password) { found_user.authenticate('invalid') }

      it 'with valid password' do
        expect(found_user).to eq found_user.authenticate(user.password)
      end

      it 'with invalid password' do
        expect(user).not_to eq user_for_invalid_password
      end

      it 'fgfg' do
        expect(user_for_invalid_password).to eq(false)
      end
    end

    describe 'when password doesn\'t match confirmation' do
      before { user.password_confirmation = 'mismatch' }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'when email is not present' do
    let(:user) { User.new(name: 'Example User', email: ' ') }

    it { is_expected.not_to be_valid }
  end

  describe 'when name is not present' do
    let(:user) { User.new(name: ' ', email: 'user@example.com') }

    it { is_expected.not_to be_valid }
  end

  describe 'when name is too long' do
    let(:user) { User.new(name: 'a' * 51, email: 'user@example.com') }

    it { is_expected.not_to be_valid }
  end

  describe 'when email have more than one dot' do
    let(:user) { User.new(name: 'Example User', email: 'user@ex.ample.com') }

    it { is_expected.not_to be_valid }
  end

  describe 'when email have more than one dot' do
    let(:user) { User.new(name: 'Example User', email: 'u.ser@example.com') }

    it { is_expected.not_to be_valid }
  end

  describe 'check emails format' do
    subject { user }

    let(:user) do
      User.new(
        name: 'Example User2',
        email: 'user@example.com',
        password: 'foobar',
        password_confirmation: 'foobar',
      )
    end

    context 'when email format is invalid' do
      let(:addresses) do
        %w(user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com)
      end

      it 'be invalid' do
        addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end
    end

    context 'when email format is valid' do
      it 'be valid' do
        addresses = %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn)
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end

    context 'when email address is already taken' do
      before do
        user_with_same_email = user.dup
        user_with_same_email.email = user.email.upcase
        user_with_same_email.save
      end

      it { is_expected.not_to be_valid }
    end

    context 'when email address with mixed case' do
      let(:mixed_case_email) { 'Foo@ExAMPle.CoM' }

      it 'when saved in all lower-case' do
        user.email = mixed_case_email
        user.save
        expect(user.reload.email).to eq mixed_case_email.downcase
      end
    end
  end
end
