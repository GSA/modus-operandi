class Operation < ActiveRecord::Base
	acts_as_taggable_on :tags
	acts_as_nested_set
  has_many :links, :as => :linkable, :dependent => :destroy
  acts_as_url :name, :scope => :operation_type
  belongs_to :operation_type

  scope :top_level, -> { where(:parent_id => nil) }

  def to_param
	  url
	end

	def full_map(elements=[:children, :tags, :links])
		map = self.attributes
		map[:children] = self.children.collect { |child| child.full_map } if elements.include? :children
		map[:tags] = self.tags.collect { |tag| tag.attributes } if elements.include? :tags
		map[:links] = self.links.collect { |link| link.attributes } if elements.include? :links
		map
	end

	
end
