require 'spec_helper'

describe Prospect do
	it {should have_db_column(:name).of_type(:string)}
	it {should have_db_column(:email).of_type(:string)}
	it {should have_db_column(:phone).of_type(:string)}
	it {should have_db_column(:inquiry).of_type(:text)}
	it {should have_db_column(:admin_comments).of_type(:text)}
	it {should have_db_column(:created_at).of_type(:datetime)}
	it {should have_db_column(:updated_at).of_type(:datetime)}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:phone)}
	it {should respond_to(:inquiry)}
	it {should respond_to(:admin_comments)}
	it {should respond_to(:created_at)}
	it {should respond_to(:updated_at)}

	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:inquiry)}

	it {should_not validate_presence_of(:admin_comments)}


	describe '#contact_information_present?' do
		let(:prospect){Prospect.new(:name => 'rhea', :inquiry => 'tell me stuff')} 

		context 'with a phone number but no email' do
			it 'is valid' do
				prospect.phone = '832-496-5167'
				expect(prospect).to be_valid
			end		
		end

		context 'with an email address but no phone' do
			it 'is valid' do
				prospect.email = 'rhea.ghosh@gmail.com'
				expect(prospect).to be_valid
			end
		end

		context 'with both email and phone number' do
			it 'is valid' do
				prospect.phone = '832-496-5167'
				prospect.email = 'rhea.ghosh@gmail.com'
				expect(prospect).to be_valid
			end
		end

		context 'with neither email or phone number' do
			it 'is not valid' do
				expect(prospect).to be_invalid
			end
		end	
	end

end

