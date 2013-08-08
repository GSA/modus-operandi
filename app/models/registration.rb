class Registration < ActiveRecord::Base
	acts_as_taggable_on :tags
	before_validation :generate_uid

	has_many :sections, :dependent => :destroy
	has_many :links, :as => :linkable, :dependent => :destroy
	
	def generate_uid
    self.uid = SecureRandom.uuid if self.uid.blank?
  end

  def full_map
  	{
  		:self => 'self.to_json'
  	}
  end
end
