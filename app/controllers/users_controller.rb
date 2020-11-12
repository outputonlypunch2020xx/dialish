class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @diaries = user.diaries
    @user = User.find(params[:id])

    # @diary_data = Diary.pluck(:diary_text)
    # @comment_data = Comment.pluck(:comment_text)
    # @data = @diary_data, @comment_data
    #@chart = Diary.all
    # @data = {'2019-06-01' => 100, '2019-06-02' => 200, '2019-06-03' => 150}
  end
end
