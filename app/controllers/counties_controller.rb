class CountiesController < ApplicationController
  before_action :set_state
  before_action :set_county, only: [:show, :edit, :destroy, :update]

  def index
    @counties = @state.counties
  end

  def show
  end

  def new
    @county = @state.counties.new
  end

  def edit
  end

  def create
    @county = @state.counties.create(county_params)
    if @county.save
      redirect_to [ @state, @county ], notice: 'County was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @county.update(county_params)
      redirect_to [@state, @county], notice: 'County was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @county.destroy
    redirect_to state_counties_url
  end

  private
    def set_state
      @state = State.find(params[:state_id])
    end

    def set_county
      @county = @state.counties.find(params[:id])
    end

    def county_params
      params.require(:county).permit(:name, :population, :state_id)
    end
end
