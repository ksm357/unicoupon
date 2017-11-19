class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_memo, only: [:edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]
  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to '/memos'
  end
  
# Read

  def index
    @memos = Memo.all.reverse
  end
 
 # Update 
  def edit
    redirect_to @memo unless current_user == @memo.user 
  end
  
  
  def update
    @memo.update(memo_params)
    #redirect_to memo_path(@memo)
    redirect_to @memo
  end
  
#Destroy
  def destroy
    @memo.destroy!
    redirect_to root_path
  end
  
  private
  def set_memo
    @memo = Memo.find(params[:id])
  end
  
  def memo_params
    params.require(:memo).permit(:title, :content, :user_id)
  end

  def is_owner?
    redirect_to root_path @memo unless current_user == @memo.user 
  end
end
