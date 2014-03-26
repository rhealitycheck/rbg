require 'spec_helper'

describe "form submission" do
	describe "home page click" do
		before do 
			visit root_path
		end
		it "has link to form on homepage" do
			#save_and_open_page #use this to see the page so you can test what you are seeing
			expect(page).to have_link("Contact Us")
		end
		it "redirects to form on link click" do
			click_link("Contact Us")
			expect(current_path).to eq(new_prospect_path)
		end
	end
	describe "form submission page" do
		before do
			visit new_prospect_path
		end
		context "with valid input" do
			before do
				fill_in("Name", with: "rhea")
				fill_in("Phone", with: "8324965167")
				fill_in("Email", with: "rhea.ghosh@gmail.com")
				fill_in("Inquiry", with: "i love cats.")
			end
			it "saves the prospect" do
				expect{ click_button("Submit") }.to change(Prospect, :count).by(1)
			end
			it "redirects to home page when submitted" do
				click_button("Submit")
				expect(current_path).to eq(root_path)
			end
			it "displays flash confirmation message when submitted" do
				click_button("Submit")
				expect(page).to have_content("Your inquiry has been submitted")
			end
		end
		context "with invalid input" do
			before do
				#fill_in("Name", with: "rhea")
				fill_in("Phone", with: "8324965167")
				fill_in("Email", with: "rhea.ghosh@gmail.com")
				fill_in("Inquiry", with: "i love cats.")
			end
			it "does not save the prospect" do
				expect{ click_button("Submit") }.to change(Prospect, :count).by(0)
			end
			it "does not redirect to home page when submitted" do
				click_button("Submit")
				expect(current_path).to eq(prospects_path)
			end
			it "displays flash error message when submitted" do
				click_button("Submit")
				expect(page).to have_content("Form submission could not be submitted")
			end
		end
	end
end