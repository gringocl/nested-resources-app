class CountiesController < ApplicationController
  #before_action :set_county, only: [:show, :edit, :update, :destroy]

  # GET /state/:state_id/counties
  def index
    @state = State.find(params[:state_id])
    @counties = @state.counties
  end

  # GET /states/:state_id/counties/:id
  def show
    @state = State.find(params[:state_id])
    @county = @state.counties.find(params[:id])
  end

  # GET /states/:state_id/counties/new
  def new
    @state = State.find(params[:state_id])
    @county = @state.counties.new
  end

  # GET /states/:state_id/counties/:id/edit
  def edit
    @state = State.find(params[:state_id])
    @county = @state.counties.find(params[:id])
  end

  # POST /states/:state_id/counties/:id
  def create
    @state = State.find(params[:state_id])
    @county = @state.counties.new(county_params)

    respond_to do |format|
      if @county.save
        format.html { redirect_to state_county_path(@state, @county), notice: 'County was successfully created.'}
        format.json { render action: 'show', status: :created, location: @county }
      else
        format.html { render action: 'new' }
        format.json { render json: @county.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state/:state_id/counties/:id
  def update
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])

    respond_to do |format|
      if @county.update(county_params)
        format.html { redirect_to ([@state, @county]), notice: 'County was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @county.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counties/1
  # DELETE /counties/1.json
  def destroy
    @county = County.find(params[:id])
    @county.destroy
    respond_to do |format|
      format.html { redirect_to state_counties_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def county_params
      params.require(:county).permit(:name, :population, :state_id)
    end
end
