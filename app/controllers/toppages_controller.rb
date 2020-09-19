class ToppagesController < ApplicationController
  def index
    if logged_in?
      @diary = current_user.diaries.build
      @diaries = current_user.feed_diaries.order(id: :desc).page(params[:page])
    else
      @diaries = Diary.all.order(id: :desc).page(params[:page])
    end
  end
end
