class PropertiesController < ApplicationController
	before_action :find_property, only:[:show, :edit, :update, :destroy]
	def index
		if params[:category].blank?
		@properties = Property.all.order("created_at DESC")
		else
		@category_id = Category.find_by(name: params[:category]).id
		@properties = Property.where(category_id: @category_id).order("created_at DESC")
	end
	end 

	def show	
		 
	end

	def new
		@property = current_user.properties.build
	end

	def create
		@property = current_user.properties.build(properties_params)
		if @property.save
			redirect_to @property
		else
			render "New"
		end
	end

	def edit
		
	end
	def update
		if @property.update(properties_params)
			redirect_to @property
		else
			render "edit"
		end
		
	end
	def destroy
		@property.destroy
		redirect_to root_path
		
	end
	private

	def properties_params
		params.require(:property).permit(:pName,:county, :locality,:pDescription,:price,:fName,:lName,:phone,:url, :category_id, :image)

	end
	def find_property
		@property = Property.find(params[:id])
		
	end

end

