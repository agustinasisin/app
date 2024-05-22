require "application_system_test_case"

class ProfessionalsTest < ApplicationSystemTestCase
  setup do
    @professional = professionals(:one)
  end

  test "visiting the index" do
    visit professionals_url
    assert_selector "h1", text: "Professionals"
  end

  test "should create professional" do
    visit professionals_url
    click_on "New professional"

    fill_in "First name", with: @professional.first_name
    fill_in "Last name", with: @professional.last_name
    fill_in "Specialty", with: @professional.specialty
    click_on "Create Professional"

    assert_text "Professional was successfully created"
    click_on "Back"
  end

  test "should update Professional" do
    visit professional_url(@professional)
    click_on "Edit this professional", match: :first

    fill_in "First name", with: @professional.first_name
    fill_in "Last name", with: @professional.last_name
    fill_in "Specialty", with: @professional.specialty
    click_on "Update Professional"

    assert_text "Professional was successfully updated"
    click_on "Back"
  end

  test "should destroy Professional" do
    visit professional_url(@professional)
    click_on "Destroy this professional", match: :first

    assert_text "Professional was successfully destroyed"
  end
end
