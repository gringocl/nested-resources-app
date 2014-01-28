class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  def index
    @states = State.all
  end

  def show
  end

  def new
    @state = State.new
  end

  def edit
  end

  def create
    @state = State.new(state_params)
    if @state.save
      redirect_to @state, notice: 'State was successfully created.'
    else
      render action: 'new'.
    end
  end

  def update
    if @state.update(state_params)
     redirect_to @state, notice: 'State was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @state.destroy
      redirect_to states_url
    end
  end

  private
    def set_state
      @state = State.find(params[:id])
    end

    def state_params
      params.require(:state).permit(:name, :population, :abbreviation)
    end
end
