class Project < ActiveRecord::Base

    has_many :pictures, dependent: :destroy

	validates :title, presence: true, length: { maximum: 80},
				uniqueness: { case_sensitive: false }

	validates :description, presence: true, length: { maximum: 512} 

	accepts_nested_attributes_for :pictures , :reject_if => proc { |attributes| attributes['image'].blank? }, :allow_destroy => true
	
end
