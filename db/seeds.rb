# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

begin
	y = YAML::load(File.open(Rails.root.join('config',"seeds.yml")))
rescue
	puts "ERROR: Unable to load seeds.yml"
end

puts "NOTICE: only three levels of depth are currently supported."

def create_operation(new_op, ot, parent_op=nil)
	cur_op = Operation.create(
			:name => new_op[:name],
			:description => new_op[:description],
			:dependencies => new_op[:dependencies],
			:whats_next => new_op[:whats_next],
			:help => new_op[:help],
			:tag_list => new_op[:tag_list],
			:operation_type => ot,
			:parent_id => parent_op.nil? ? nil : parent_op.id 
		)
	if new_op[:links]
		if new_op[:links].is_a? Array
			new_op[:links].each do |link|
				cur_op.links << Link.create(:name => link['name'], :url => link['url'])
			end
		else
			cur_op.links << Link.create(:name => new_op[:links]['name'], :url => new_op[:links]['url'])
		end
	end
	cur_op
end

def assemble_op_hash(op)
	new_op = { :name => op.first }
	if op.second
		new_op[:description] = op.second['description']
		new_op[:links] = op.second['link']
		new_op[:tag_list] = op.second['tag_list']
		new_op[:dependencies] = op.second['dependencies']
		new_op[:whats_next] = op.second['whats_next']
		new_op[:help] = op.second['help']
	end
	new_op
end





y.keys.each do |key|
	unless ot = OperationType.find_by_name(key)
		ot = OperationType.create(:name => key.singularize)
	end

	y[key].each do |op|
		new_op = assemble_op_hash(op)
		new_opl1 = create_operation(new_op, ot)
		pp "Created operation: #{new_opl1.name}"

		if op.second.has_key? 'children' and !op.second['children'].nil?
			op.second['children'].each do |opl2|
				new_op = assemble_op_hash(opl2)
				new_opl2 = create_operation(new_op, ot, new_opl1)
				pp "Created operation: #{new_opl2.name}"

				if opl2.second.has_key? 'children' and !opl2.second['children'].nil?
					opl2.second['children'].each do |opl3|

						new_op = assemble_op_hash(opl3)
						new_opl3 = create_operation(new_op, ot, new_opl2)
						pp "Created operation: #{new_opl3.name}"

					end
				end

			end

		end

		
	end

end

