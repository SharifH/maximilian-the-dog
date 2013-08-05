class Event < ActiveRecord::Base
  attr_accessible :title, :description, :eventable_id, :eventable_type

  #can belong to expert, user, or skill - need to reflect this in those models
  belongs_to :eventable, polymorphic: true
  has_many :availability_blocks
  has_many :skills, as: :skillable

  validates :title, presence: true, 
            length: { maximum: 50, too_long: "%{count} characters is the maximum allowed." }

  validates_presence_of :eventable
  
end

