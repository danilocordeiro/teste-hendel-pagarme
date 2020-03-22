require "application_system_test_case"

class InformationTest < ApplicationSystemTestCase
  setup do
    @information = information(:one)
  end

  test "visiting the index" do
    visit information_url
    assert_selector "h1", text: "Information"
  end

  test "creating a Information" do
    visit information_url
    click_on "New Information"

    fill_in "Complementary", with: @information.complementary
    fill_in "Ddd", with: @information.ddd
    fill_in "Document number", with: @information.document_number
    fill_in "Neighborhood", with: @information.neighborhood
    fill_in "Phone number", with: @information.phone_number
    fill_in "Street", with: @information.street
    fill_in "Street number", with: @information.street_number
    fill_in "Zipcode", with: @information.zipcode
    click_on "Create Information"

    assert_text "Information was successfully created"
    click_on "Back"
  end

  test "updating a Information" do
    visit information_url
    click_on "Edit", match: :first

    fill_in "Complementary", with: @information.complementary
    fill_in "Ddd", with: @information.ddd
    fill_in "Document number", with: @information.document_number
    fill_in "Neighborhood", with: @information.neighborhood
    fill_in "Phone number", with: @information.phone_number
    fill_in "Street", with: @information.street
    fill_in "Street number", with: @information.street_number
    fill_in "Zipcode", with: @information.zipcode
    click_on "Update Information"

    assert_text "Information was successfully updated"
    click_on "Back"
  end

  test "destroying a Information" do
    visit information_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Information was successfully destroyed"
  end
end
