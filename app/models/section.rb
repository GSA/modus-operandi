class Section < ActiveRecord::Base
  belongs_to :registration
  acts_as_taggable_on :tags
  has_many :tasks, :dependent => :destroy
  has_many :links, :as => :linkable, :dependent => :destroy
end
