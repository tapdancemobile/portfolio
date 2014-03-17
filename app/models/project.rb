class Project < ActiveRecord::Base

    has_many :pictures, dependent: :destroy

	validates :title, presence: true, length: { maximum: 80},
				uniqueness: { case_sensitive: false }

	validates :description, presence: true, length: { maximum: 512} 

end
