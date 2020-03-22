require "application_system_test_case"

class SplitRulesTest < ApplicationSystemTestCase
  setup do
    @split_rule = split_rules(:one)
  end

  test "visiting the index" do
    visit split_rules_url
    assert_selector "h1", text: "Split Rules"
  end

  test "creating a Split rule" do
    visit split_rules_url
    click_on "New Split Rule"

    fill_in "Percentage", with: @split_rule.percentage
    click_on "Create Split rule"

    assert_text "Split rule was successfully created"
    click_on "Back"
  end

  test "updating a Split rule" do
    visit split_rules_url
    click_on "Edit", match: :first

    fill_in "Percentage", with: @split_rule.percentage
    click_on "Update Split rule"

    assert_text "Split rule was successfully updated"
    click_on "Back"
  end

  test "destroying a Split rule" do
    visit split_rules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Split rule was successfully destroyed"
  end
end
