class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
  
  def to_s
      title
  end
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
