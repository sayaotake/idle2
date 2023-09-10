class OpinionsController < ApplicationController
    before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    opinion = event.opinions.build(opinion_params) #buildを使い、contentとevent_idの二つを同時に代入
    opinion.user_id = current_user.id
    if opinion.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end
  end

  private

    def opinion_params
      params.require(:opinion).permit(:content)
    end
end
