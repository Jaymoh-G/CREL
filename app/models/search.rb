class Search < ActiveRecord::Base
	def properties 
			@properties ||= find_properties

	end
	def subcategories

		@subcategories ||= find_subcategories	

	end
	def find_subcategories
		subcategories = Subcategory.order(:name)

		subcategories = subcategories.where(category_id: category_id) if category_id.present?
	 subcategories  
	   
	end

	def find_properties
		

	    properties = Property.order(:pName)
	    
	
		properties = properties.where(["county like ?", "%#{county}%"]) if county.present?
		properties = properties.where(category_id: category_id) if category_id.present?
		properties = properties.where("price >= ?", min_price) if min_price.present?
		properties = properties.where("price <= ?", max_price) if max_price.present?       
       properties
      

end
end
