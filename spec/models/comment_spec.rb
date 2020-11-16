require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do


  it 'comment_textがない場合は登録できないこと' do
    comment = FactoryBot.build(:comment, comment_text: nil)
    comment.valid?
    expect(comment.errors[:comment_text])
  end

end
end