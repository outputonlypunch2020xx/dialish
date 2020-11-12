class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diaries, only: [:index, :show]
  before_action :set_find_diary, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @diary = Diary.new
  end

  def create
    if Diary.create(diary_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:titel, :diary_text).merge(user_id: current_user.id)
  end

  def set_diaries
    @diaries = Diary.all.order("created_at DESC")
  end

  def set_find_diary
    @diary = Diary.find(params[:id])
  end

  def correct_user
    unless user_signed_in? && current_user.id == @diary.user_id
     redirect_to action: :index
   end
  end
end
