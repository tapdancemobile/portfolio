class Picture < ActiveRecord::Base

  belongs_to :project

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 

  validates :project_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }

end
