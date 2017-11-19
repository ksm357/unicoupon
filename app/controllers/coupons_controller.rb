class CouponsController < ApplicationController
    
    def create
        coupon = Coupon.new
        coupon.user_id = current_user.id
    end
    
end
