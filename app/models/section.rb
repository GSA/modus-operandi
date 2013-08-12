class Section < ActiveRecord::Base
  belongs_to :registration
  acts_as_taggable_on :tags
  has_many :tasks, :dependent => :destroy
  has_many :links, :as => :linkable, :dependent => :destroy

  def full_map
  	@map ||= generate_map
  end

  def generate_map(elements=[:tasks, :tags, :links])
  	@map = self.attributes
  	@map[:tasks] = []
    @map[:tasks] = self.tasks.collect { |task| task.full_map } if elements.include? :tasks
    @map[:tags] = self.tags.collect { |tag| tag.attributes } if elements.include? :tags
    @map[:links] = self.links.collect { |link| link.attributes } if elements.include? :links
    @map
  end
end
