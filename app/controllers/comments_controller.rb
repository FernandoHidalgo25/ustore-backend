class CommentsController < ApplicationController

    def create
        comment = logged_in_user.comments.create!(comment_params)
        render json: comment
    end 

    private

    def comment_params
        params.permit(:store_id, :rating, :content)
    end 
end
