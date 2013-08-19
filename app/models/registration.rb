class Registration < ActiveRecord::Base
	acts_as_taggable_on :tags
	before_validation :generate_uid

	has_many :sections, :dependent => :destroy
	has_many :links, :as => :linkable, :dependent => :destroy
	
	def generate_uid
    self.uid = SecureRandom.uuid if self.uid.blank?
  end

  def full_map
  	@map ||= generate_map
  end

  def generate_map(elements=[:sections, :tags, :links])
    @map = self.attributes
    @map[:sections] = []
    @map[:sections] = self.sections.collect { |section| section.full_map } if elements.include? :sections
    @map[:tags] = self.tags if elements.include? :tags
    @map[:links] = self.links if elements.include? :links
    @map
  end
  
end
