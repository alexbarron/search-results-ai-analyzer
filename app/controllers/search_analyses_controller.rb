class SearchAnalysesController < ApplicationController
  before_action :set_search_analysis, only: %i[ show destroy ]

  # GET /search_analyses or /search_analyses.json
  def index
    @search_analyses = SearchAnalysis.all
  end

  # GET /search_analyses/1 or /search_analyses/1.json
  def show
  end

  # GET /search_analyses/new
  def new
    @search_analysis = SearchAnalysis.new
  end

  # POST /search_analyses or /search_analyses.json
  def create
    @search_analysis = SearchAnalysis.new(search_analysis_params)

    respond_to do |format|
      if @search_analysis.save
        format.html { redirect_to search_analysis_url(@search_analysis), notice: "Search analysis was successfully created." }
        format.json { render :show, status: :created, location: @search_analysis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_analyses/1 or /search_analyses/1.json
  def destroy
    @search_analysis.destroy

    respond_to do |format|
      format.html { redirect_to search_analyses_url, notice: "Search analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_analysis
      @search_analysis = SearchAnalysis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_analysis_params
      params.require(:search_analysis).permit(:query, :engine, :prompt)
    end
end
