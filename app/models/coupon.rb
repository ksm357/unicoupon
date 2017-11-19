class Coupon < ActiveRecord::Base
    has_many :users
    has_many :counts
end
