class Task < ActiveRecord::Base
  belongs_to :section
  acts_as_taggable_on :tags
  has_many :links, :as => :linkable, :dependent => :destroy
end
