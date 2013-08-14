# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ******** These seeds were created for the DEMO.. see seeds.yml for future implementations **********
r = Registration.create(:name => 'SAM (System of Award Management) Registration Process', :description => 'The System for Award Management (SAM) is the Official U.S. Government system that consolidated the capabilities of CCR/FedReg, ORCA, and EPLS. This is your starting point for clearing the requirements of RFP-EZ and various other platforms within the federal government. Often, this process can seem daunting and you might not know where to start. Our walkthrough allows you to collect the necessary information you will need to complete SAM registration ahead of time. Furthermore, business owners can get the help they need at any step along the SAM path.')
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
r.sections.last.tasks << Task.create(:name => 'Goods and Services (NAICS, PSC)', :dependencies => 'NAICS Code (industry classification)-- SAM will provide a search but users could also pre-locate their code via the Census search tool: http://www.census.gov/eos/www/naics/. Product or Service Codes')
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

r = Registration.create(:name => 'SBIR (Small Business Innovation Research)', :description => "The Small Business Innovation Research (SBIR) program is a highly competitive program that encourages domestic small businesses to engage in Federal Research/Research and Development (R/R&D) that has the potential for commercialization. Through a competitive awards-based program, SBIR enables small businesses to explore their technological potential and provides the incentive to profit from its commercialization. By including qualified small businesses in the nation's R&D arena, high-tech innovation is stimulated and the United States gains entrepreneurial spirit as it meets its specific research and development needs.")