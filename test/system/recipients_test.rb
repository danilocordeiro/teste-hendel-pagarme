require "application_system_test_case"

class RecipientsTest < ApplicationSystemTestCase
  setup do
    @recipient = recipients(:one)
  end

  test "visiting the index" do
    visit recipients_url
    assert_selector "h1", text: "Recipients"
  end

  test "creating a Recipient" do
    visit recipients_url
    click_on "New Recipient"

    fill_in "Agencia", with: @recipient.agencia
    fill_in "Agendia dv", with: @recipient.agendia_dv
    fill_in "Bank code", with: @recipient.bank_code
    fill_in "Code", with: @recipient.code
    fill_in "Conta", with: @recipient.conta
    fill_in "Conta dv", with: @recipient.conta_dv
    fill_in "Document number", with: @recipient.document_number
    fill_in "Legal name", with: @recipient.legal_name
    check "Transfer enabled" if @recipient.transfer_enabled
    click_on "Create Recipient"

    assert_text "Recipient was successfully created"
    click_on "Back"
  end

  test "updating a Recipient" do
    visit recipients_url
    click_on "Edit", match: :first

    fill_in "Agencia", with: @recipient.agencia
    fill_in "Agendia dv", with: @recipient.agendia_dv
    fill_in "Bank code", with: @recipient.bank_code
    fill_in "Code", with: @recipient.code
    fill_in "Conta", with: @recipient.conta
    fill_in "Conta dv", with: @recipient.conta_dv
    fill_in "Document number", with: @recipient.document_number
    fill_in "Legal name", with: @recipient.legal_name
    check "Transfer enabled" if @recipient.transfer_enabled
    click_on "Update Recipient"

    assert_text "Recipient was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipient" do
    visit recipients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipient was successfully destroyed"
  end
end
