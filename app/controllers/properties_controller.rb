class PropertiesController < ApplicationController
	before_action :find_property, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index		
	
		if 
			 params[:category].blank?
			@properties = Property.all.order("created_at DESC")
			else
							
			@category_id = Category.find_by(name: params[:category]).id  
			@properties = Property.where(category_id: @category_id).order("created_at DESC")
				 
		  end

		 if  		
				       	       		   	
		   params[:subcategory]
						
			@subcategory_id = Subcategory.find_by(name: params[:subcategory]).id 
			@properties = Property.where(subcategory_id: @subcategory_id).order("created_at DESC")
				end
			
		if params[:search]
							@properties =Property.where(["pName LIKE ?","%#{params[:search]}%"])
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
			render "new"
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
		params.require(:property).permit(:pName,:county, :locality,:pDescription,:price,:fName,:lName,:phone,:url, :category_id,:subcategory_id, :image)

	end
	def find_property
		@property = Property.find(params[:id])
		
	end

end

