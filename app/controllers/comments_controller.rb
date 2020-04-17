# class CommentsController < ApplicationController
#   before_action :set_instance

#   def create
#     @comment = Comment.create(comment_params)
#      respond_to do |format|
#       format.html { redirect_to product_path(params[:product_id])  }
#       format.json
#     end
#   end

#   def destroy
#     @comment = Comment.find_by(id: params[:id])
#     @comment.destroy
#     redirect_to "/products/#{@product.id}"
#   end

#   private
#   def comment_params
#     params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
#   end

#   def set_instance
#     @product = Product.find(params[:product_id])
#   end
# end
