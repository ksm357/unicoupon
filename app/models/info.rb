class Info < ActiveRecord::Base
    belongs_to :school
    has_many :addresses
    
    #mount_uploader :info_image_url, ImageUploader
end
