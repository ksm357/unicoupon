require 'geocoder'

class InfosController < ApplicationController
  def index
    @storeInfo = Info.all.reverse
    #@oneInfo = Info.search(params[:info_id])
  end
  
  def new
    @info = Info.new
  end
  
  def show 
    @storeInfo = Info.all.reverse
    @schoolName = params[:schoolName]
    # @info = Info.find(params[:school_name])
  end
  
  def create
    
    @locate_change = Geocoder.coordinates(params[:info][:address])
    
    @info = Info.new(info_params)
    
    u = InfoUploader.new
    u.store!(params[:info][:info_image_url])
    @info.info_image_url = u
    # @info.info_image_url = File.open(Rails.root + "app/assets/images/bg.jpg")
    
    @info.location_lat = @locate_change[0]
    @info.location_lng = @locate_change[1]
    # @info.info_image_url = File.open(Rails.root + "app/assets/images/default/8.png")
    
    if @info.save
      
      redirect_to @info, notice: 'Post was successfully created.' 
    else
      redirect_to :back
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_params
      params.require(:info).permit(:schoolName, :title, :content, :address, :url)
    end
end
