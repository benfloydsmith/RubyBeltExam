class ShoesController < ApplicationController
	def index
		@shoes = Shoe.where(buyer: nil)
	end
	def create
		shoe = Shoe.new(product:shoe_params[:product], amount:shoe_params[:amount], seller:current_user)
		if shoe.save
			redirect_to :back
		else
			flash[:errors] = shoe.errors.full_messages
			redirect_to :back
		end
	end	
	def update
		Shoe.find(params[:id]).update(buyer: current_user)
		redirect_to "/users/#{current_user.id}"
	end
	def destroy
		Shoe.find(params[:id]).destroy
		redirect_to :back
	end

	private	
		def shoe_params
			params.require(:shoe).permit(:product, :amount)
		end
end





