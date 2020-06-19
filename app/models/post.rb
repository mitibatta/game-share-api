class Post < ApplicationRecord
  validates :user_id, presence:true
  validates :text, presence:true

  belongs_to :user
  has_many :pictures
  has_many :favorites
  has_many :comments
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps, source:'tag'
  has_many :favorite_users, through: :favorites, source:'user'

  accepts_nested_attributes_for :pictures

  def save_posts(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags
  
      # Destroy old taggings:
      old_tags.each do |old_name|
        self.tags.delete Tag.find_by(name:old_name)
      end
  
      # Create new taggings:
      new_tags.each do |new_name|
        post_tag = Tag.find_or_create_by(name:new_name)
        self.tags << post_tag
        # post_tag = Tag.new(name:new_name)
        # post_tag.save
      end
    end

end
