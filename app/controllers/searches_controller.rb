class SearchesController < ApplicationController
	def new
		@search =Search.new

	end

	def create
		@search = Search.create!(search_params)
		redirect_to @search		
	end
	def show
		@search = Search.find(params[:id])
		
	end
	private
	def search_params
		params.require(:search).permit(:county,:locality,:category_id,:subcategory_id,:min_price,:max_price)
		
	end
	def test
		show 'test'
	end
end
