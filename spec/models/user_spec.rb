require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  
    it 'nameがない場合は登録できないこと' do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'encrypted_passwordがない場合は登録できないこと' do
      user = FactoryBot.build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password])
    end

    it 'passwordが存在してもencrypted_passwordがない場合は登録できないこと' do
      user = FactoryBot.build(:user, encrypted_password: '')
      user.valid?
      expect(user.errors[:encrypted_password])
    end

  end
end
