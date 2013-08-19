class Task < ActiveRecord::Base
  belongs_to :section
  acts_as_taggable_on :tags
  has_many :links, :as => :linkable, :dependent => :destroy

  def full_map
  	@map ||= generate_map
  end

  def generate_map(elements=[:tags, :links])
  	@map = self.attributes
    @map[:tags] = self.tags if elements.include? :tags
    @map[:links] = self.links if elements.include? :links
    @map
  end
end
