class School < ActiveRecord::Base
    belongs_to :user
    belongs_to :info
end
