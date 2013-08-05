class Skill < ActiveRecord::Base
  attr_accessible :tag, :skillable_id, :skillable_type

  #can belong to expert or event
  belongs_to :skillable, polymorphic: true
  has_many :events, as: :eventable

  validates_presence_of :tag, :skillable
end
