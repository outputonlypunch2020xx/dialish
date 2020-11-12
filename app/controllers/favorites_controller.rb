class FavoritesController < ApplicationController
  def create
    
    @favorite = current_user.favorites.create(diary_id: params[:diary_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
     @diary = Diary.find(params[:diary_id])
     @favorite = current_user.favorites.find_by(diary_id: @diary.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
