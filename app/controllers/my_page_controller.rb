class MyPageController < ApplicationController
    def show
        @user = User.find(params[:id])
        
        
    end
end
