require "rails_helper"

describe "the product management path" do
  # before do
  #   @user = FactoryBot.create(:user)
  #   click_button 'Sign in'
  #   fill_in "Email", with: @user.email
  #   fill_in "Password", with: @user.password
  #   click_button "Log in"
  # end

  it "does not allow users to add new products" do
    visit new_product_path
    # expect(page).to have_content("You aren't authorized to do that.")
    expect(page).to have_no_content("Add a Product")
  end

  it "allows an admin to add new products" do
    @user.update(admin: true)
    visit new_product_path
    fill_in "Name", with: "Carbonite Underpants"
    fill_in "Description", with: "Boonswoggle."
    fill_in "Price", with: 12
    fill_in "Quantity", with: 20
    click_button "Save"
    expect(page).to have_content("Boonswoggle")
  end

  it "displays errors if product cannot be created" do
    @user.update(admin: true)
    visit new_product_path
    click_button "Save"
    expect(page).to have_content(nil)
  end

  it "allows an admin to edit products" do
    @user.update(admin: true)
    product = FactoryBot.create!(:product)
    visit edit_product_path(product)
    fill_in "Name", with: "BEEShoggle!"
    click_button "Save"
    expect(page).to have_content("BEEShoggle!")
  end

  it "displays errors if product cannot be updated" do
    @user.update(admin: true)
    product= FactoryBot.create(:product)
    visit edit_product_path(product)
    fill_in "Name", with: ""
    click_button "Save"
    expect(page).to have_content("Something went wrong")
  end

  it "allows admin to delete products" do
    @user.update(admin: true)
    product = FactoryBot.create(:product)
    visit product_path(product)
    click_on "Delete"
    expect(page).to have_no_content("Fizzbobble")
  end
end
