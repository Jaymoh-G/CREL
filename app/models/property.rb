class Property < ActiveRecord::Base
	 
	belongs_to :category
	belongs_to :subcategory
	belongs_to :user
	validates :price,:fName,:phone,:pName,:county,:locality,:pDescription,presence: true
    validates :price, :phone, numericality: {}

	has_attached_file :image, styles: { medium: "300x300" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
