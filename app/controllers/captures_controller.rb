class CapturesController < ApplicationController
    def create
        capture = current_user.captures.create(event_id: params[:event_id]) #user_idとevent_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        capture = Capture.find_by(event_id: params[:event_id], user_id: current_user.id)
        capture.destroy
        redirect_back(fallback_location: root_path)
      end
end
