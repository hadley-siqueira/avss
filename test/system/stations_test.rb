require "application_system_test_case"

class StationsTest < ApplicationSystemTestCase
  setup do
    @station = stations(:one)
  end

  test "visiting the index" do
    visit stations_url
    assert_selector "h1", text: "Stations"
  end

  test "should create station" do
    visit stations_url
    click_on "New station"

    fill_in "Evaluation", with: @station.evaluation
    fill_in "Feedback", with: @station.feedback
    fill_in "Level", with: @station.level
    fill_in "Minutes", with: @station.minutes
    fill_in "Name", with: @station.name
    fill_in "Procedure", with: @station.procedure
    fill_in "Resume", with: @station.resume
    fill_in "Score", with: @station.score
    click_on "Create Station"

    assert_text "Station was successfully created"
    click_on "Back"
  end

  test "should update Station" do
    visit station_url(@station)
    click_on "Edit this station", match: :first

    fill_in "Evaluation", with: @station.evaluation
    fill_in "Feedback", with: @station.feedback
    fill_in "Level", with: @station.level
    fill_in "Minutes", with: @station.minutes
    fill_in "Name", with: @station.name
    fill_in "Procedure", with: @station.procedure
    fill_in "Resume", with: @station.resume
    fill_in "Score", with: @station.score
    click_on "Update Station"

    assert_text "Station was successfully updated"
    click_on "Back"
  end

  test "should destroy Station" do
    visit station_url(@station)
    click_on "Destroy this station", match: :first

    assert_text "Station was successfully destroyed"
  end
end
