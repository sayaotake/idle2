class VideosController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index

        @videos = Video.all
    end
    def new
        @video = Video.new
    end
    
    def create
        video = Video.new(video_params)

        video.user_id = current_user.id

        if video.save!
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end
    
    def show
       
        @video = Video.find(params[:id])
        @comments = @video.comments
        @comment = Comment.new
    end

    def edit
        @video = Video.find(params[:id])
    end
    def update
        video = Video.find(params[:id])
        if video.update(video_params)
        redirect_to :action => "show", :id => video.id
        else
        redirect_to :action => "new"
        end
    end


    def destroy
        video = Video.find(params[:id])
        video.destroy
        redirect_to action: :index
    end

    private
        def video_params
            params.require(:video).permit(:comment, :youtube_url)
        end
end
