require "application_system_test_case"

class SearchAnalysesTest < ApplicationSystemTestCase
  setup do
    @search_analysis = search_analyses(:one)
  end

  test "visiting the index" do
    visit search_analyses_url
    assert_selector "h1", text: "Search analyses"
  end

  test "should create search analysis" do
    visit search_analyses_url
    click_on "New search analysis"

    fill_in "Chat response", with: @search_analysis.chat_response
    fill_in "Engine", with: @search_analysis.engine
    fill_in "Prompt", with: @search_analysis.prompt
    fill_in "Query", with: @search_analysis.query
    fill_in "Search results", with: @search_analysis.search_results
    click_on "Create Search analysis"

    assert_text "Search analysis was successfully created"
    click_on "Back"
  end

  test "should update Search analysis" do
    visit search_analysis_url(@search_analysis)
    click_on "Edit this search analysis", match: :first

    fill_in "Chat response", with: @search_analysis.chat_response
    fill_in "Engine", with: @search_analysis.engine
    fill_in "Prompt", with: @search_analysis.prompt
    fill_in "Query", with: @search_analysis.query
    fill_in "Search results", with: @search_analysis.search_results
    click_on "Update Search analysis"

    assert_text "Search analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Search analysis" do
    visit search_analysis_url(@search_analysis)
    click_on "Destroy this search analysis", match: :first

    assert_text "Search analysis was successfully destroyed"
  end
end
