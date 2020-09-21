class DiariesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @diary = Diary.find_by(id: params[:id])
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    
    if @diary.save
      flash[:success] = '日記を投稿しました'
      redirect_to root_url
    else
      @diaries = current_user.feed_diaries.order(id: :desc).page(params[:page])
      flash.now[:danger] = '日記の投稿に失敗しました'
      render  'toppages/index'
    end
  end

  def destroy
    @diary.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def diary_params
    params.require(:diary).permit(:title, :content)
  end
  
  def correct_user
    @diary = current_user.diaries.find_by(id: params[:id])
    unless @diary
      redirect_to root_url
    end
  end
end
