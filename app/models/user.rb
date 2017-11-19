class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :coupon
  has_many :schools
  has_many :memos
  has_many :likes
  has_many :liked_memos, through: :likes, source: :memo

  def is_like?(memo)
      Like.find_by(user_id: self.id, memo_id: memo.id).present?
  end
  
end
