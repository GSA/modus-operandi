# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Registration.create(:name => 'SAM.gov', :description => 'A valid registration with SAM.gov is required to do business with the federal government, including RFP-EZ.')
r.links << Link.create(:name => 'Registration Start URL', :url => 'https://www.sam.gov/portal/public/SAM/')
r.sections << Section.create(:name => 'Registration Overview', :dependencies => 'Requires a user account on SAM.gov from: https://www.sam.gov/portal/public/SAM/')
r.sections.last.links << Link.create(:name => 'User account registration', :url => 'https://www.sam.gov/portal/public/SAM/')
s = r.sections.last
s.tag_list = 'external dependency'
s.save
r.sections << Section.create(:name => 'Purpose of Registration')
r.sections.last.tasks << Task.create(:name => 'Determine Purpose')
r.sections << Section.create(:name => 'Core Data')
r.sections.last.tasks << Task.create(:name => 'DUNS Information', :dependencies => 'Requires a valid 9-digit DUNS number from http://fedgov.dnb.com/webform/displayHomePage.do')
r.sections.last.tasks.last.links << Link.create(:name => 'Get a DUNS Number', :url => 'http://fedgov.dnb.com/webform/displayHomePage.do')
t = r.sections.last.tasks.last
t.tag_list = 'external dependency'
t.save
r.sections.last.tasks << Task.create(:name => 'Business Information')
r.sections.last.tasks << Task.create(:name => 'IRS Consent', :dependencies => "Your company's Tax Identification Number (TIN)")
r.sections.last.tasks.last.links << Link.create(:name => 'Get a Tax Identification Number (TIN)', :url => 'http://www.irs.gov/Businesses/Small-Businesses-&-Self-Employed/Apply-for-an-Employer-Identification-Number-(EIN)-Online')
t = r.sections.last.tasks.last
t.tag_list = 'external dependency'
t.save
r.sections.last.tasks << Task.create(:name => 'CAGE or NCAGE Code', :dependencies => 'CAGE Code: You need to bring it if you have it, or SAM will automatically assign you one')
t = r.sections.last.tasks.last
t.tag_list = 'external dependency'
t.save
r.sections.last.tasks << Task.create(:name => 'General Information')
r.sections.last.tasks << Task.create(:name => 'Financial Information', :dependencies => 'EFT: Account Type, Routing Number, Account Number, ACH US Phone, ACH Non-US Phone, ACH Fax, ACH Email')
t = r.sections.last.tasks.last
t.tag_list = 'external dependency'
t.save
r.sections.last.tasks << Task.create(:name => 'Executive Compensation Questions')
r.sections.last.tasks << Task.create(:name => 'Proceedings Questions')
r.sections.last.tasks << Task.create(:name => 'Information Opt-Out')
r.sections << Section.create(:name => 'Assertions')
r.sections.last.tasks << Task.create(:name => 'Goods and Services (NAICS, PSC)', :dependencies => 'NAICS Code (industry classification)-- SAM will provide a search but users could also pre-locate their code via the Census’ search tool: http://www.census.gov/eos/www/naics/. Product or Service Codes')
r.sections.last.tasks.last.links << Link.create(:name => 'Census Search Tool', :url => 'http://www.census.gov/eos/www/naics/')
t = r.sections.last.tasks.last
t.tag_list = 'external dependency'
t.save
r.sections.last.tasks << Task.create(:name => 'Size Metrics')
r.sections.last.tasks << Task.create(:name => 'EDI Information')
r.sections.last.tasks << Task.create(:name => 'Disaster Relief Information')
r.sections << Section.create(:name => 'Representation and Certifications')
r.sections.last.tasks << Task.create(:name => 'FAR Response 1 (Federal Acquisition Regulation)')
r.sections.last.tasks << Task.create(:name => 'FAR Response 2')
r.sections.last.tasks << Task.create(:name => 'FAR Response 3')
r.sections.last.tasks << Task.create(:name => 'FAR Response 4')
r.sections.last.tasks << Task.create(:name => 'Architect-Engineer Response')
r.sections.last.tasks << Task.create(:name => 'Defense Response')
r.sections << Section.create(:name => 'Points of Contact')
r.sections.last.tasks << Task.create(:name => 'POC Details')
r.sections << Section.create(:name => 'Small Business Certification')
r.sections.last.tasks << Task.create(:name => 'SBA Profile')