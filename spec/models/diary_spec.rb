require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe '#create' do


  it 'titleがない場合は登録できないこと' do
    diary = FactoryBot.build(:diary, titel: nil)
    diary.valid?
    expect(diary.errors[:title])
  end

end
end