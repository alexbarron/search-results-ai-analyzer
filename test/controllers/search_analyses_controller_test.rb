require "test_helper"

class SearchAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_analysis = search_analyses(:one)
  end

  test "should get index" do
    get search_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_search_analysis_url
    assert_response :success
  end

  test "should create search_analysis" do
    assert_difference("SearchAnalysis.count") do
      post search_analyses_url, params: { search_analysis: { chat_response: @search_analysis.chat_response, engine: @search_analysis.engine, prompt: @search_analysis.prompt, query: @search_analysis.query, search_results: @search_analysis.search_results } }
    end

    assert_redirected_to search_analysis_url(SearchAnalysis.last)
  end

  test "should show search_analysis" do
    get search_analysis_url(@search_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_analysis_url(@search_analysis)
    assert_response :success
  end

  test "should update search_analysis" do
    patch search_analysis_url(@search_analysis), params: { search_analysis: { chat_response: @search_analysis.chat_response, engine: @search_analysis.engine, prompt: @search_analysis.prompt, query: @search_analysis.query, search_results: @search_analysis.search_results } }
    assert_redirected_to search_analysis_url(@search_analysis)
  end

  test "should destroy search_analysis" do
    assert_difference("SearchAnalysis.count", -1) do
      delete search_analysis_url(@search_analysis)
    end

    assert_redirected_to search_analyses_url
  end
end
