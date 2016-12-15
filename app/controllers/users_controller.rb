class UsersController < ApplicationController
	before_action :require_correct_user, only: [:edit, :update]
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/shoes"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to root_path
		end
	end
	def show
		@selling = Shoe.where(seller: current_user, buyer: nil)
		@sold = current_user.sellers.where.not(buyer: nil)
		@bought = Shoe.where(buyer: current_user)
		@buytotal = Shoe.where(buyer: current_user).sum(:amount)
		@selltotal = current_user.sellers.where.not(buyer: nil).sum(:amount)
		# @user = User.find(current_user.id)
	# => @user = User.find(params[:id])
	end
	
	private
		def user_params
			params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
		end

end
