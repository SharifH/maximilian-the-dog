class Expert < ActiveRecord::Base
  has_one :user, :as => :loginable
end
