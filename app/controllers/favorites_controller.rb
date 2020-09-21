class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    diary = Diary.find(params[:diary_id])
    current_user.favorite(diary)
    flash[:success] = 'お気に入りに登録しました'
    redirect_to root_path
  end

  def destroy
    diary = Diary.find(params[:diary_id])
    current_user.unfavorite(diary)
    flash[:success] = 'お気に入りから削除しました'
    redirect_to root_path
  end
end
