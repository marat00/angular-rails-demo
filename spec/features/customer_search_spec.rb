require 'rails_helper'

feature "Customer Search" do
  #The method to create a new customer
  def create_customer(first_name: nil,
  	                   last_name: nil,
  	                       email: nil)

    first_name ||= Faker::Name.first_name
    last_name  ||= Faker::Name.last_name
    email      ||= "#{Faker::Internet.user_name}#{rand(1000)}@" +
                   "#{Faker::Internet.domain_name}"

    Customer.create!(
       first_name: first_name,
    	last_name: last_name,
    	username: "#{Faker::Internet.user_name}#{rand(1000)}",
    	    email: email
    )
  end

  #The email and password to fill into the login field
  let(:email)    { "bob@example.com" }
  let(:password) { "password123" }

  before do
  	#Create a new user
	User.create!(email: email,
		 		 password: password,
	             password_confirmation: password)
    
    #Test creation of new customers using predefined names
    create_customer first_name: "Robert",
                     last_name: "Aaron"

    create_customer first_name: "Bob",
                     last_name: "Johnson"

    create_customer first_name: "JR",
                     last_name: "Bob"

    create_customer first_name: "Robby",
                         email: "bob4235705@example.com"

    create_customer first_name: "Bobby",
                     last_name: "Dickenson"

    create_customer first_name: "Bob",
                     last_name: "Jones",
                         email: "bob123@somewhere.org"

    #Navigate to the customers page
    visit "/customers"

	#Log in
	fill_in      "Email",    with: "bob@example.com"
	fill_in      "Password", with: "password123"
	click_button "Log in"
  end

  scenario "Search by Name" do
  	within "section.search-form" do
  	  fill_in "keywords", with: "bob"
  	end

  	within "section.search-results" do
  	   expect(page).to have_content("Results")
  	   expect(page.all("ol li.list-group-item").count).to eq(4)

  	   expect(page.all("ol li.list-group-item")[0]).to have_content("JR")
   	   expect(page.all("ol li.list-group-item")[0]).to have_content("Bob")

   	   expect(page.all("ol li.list-group-item")[3]).to have_content("Bob")
  	   expect(page.all("ol li.list-group-item")[3]).to have_content("Jones")
  	end
  end

  scenario "Search by Email" do
  	within "section.search-form" do
  	  fill_in "keywords", with: "bob@somewhere.org"
  	end

  	within "section.search-results" do
  	   expect(page).to have_content("Results")
  	   expect(page.all("ol li.list-group-item").count).to eq(4)

  	   expect(page.all("ol li.list-group-item")[2]).to have_content("Bob")
   	   expect(page.all("ol li.list-group-item")[2]).to have_content("Johnson")

  	   expect(page.all("ol li.list-group-item")[0]).to have_content("JR")
   	   expect(page.all("ol li.list-group-item")[0]).to have_content("Bob")

   	   expect(page.all("ol li.list-group-item")[3]).to have_content("Bob")
  	   expect(page.all("ol li.list-group-item")[3]).to have_content("Jones")
  	end
  end
end