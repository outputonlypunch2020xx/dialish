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
    @diary = Diary.new(diary_params)

    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
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

    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:titel, :diary_text, :content).merge(user_id: current_user.id)
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
