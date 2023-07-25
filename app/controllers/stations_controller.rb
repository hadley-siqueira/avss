class StationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_station, only: %i[ show edit update destroy ]

  # GET /stations or /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1 or /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new(difficulty: 3, score: 5, time: 15, feedback: 1)

    respond_to do |format|
      if @station.save
        format.html { redirect_to edit_station_path(@station), notice: "Station was successfully created." }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations or /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to station_url(@station), notice: "Station was successfully created." }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1 or /stations/1.json
  def update
    respond_to do |format|
      @station = Station.find(params[:id])

      @attachments = params[:attachments]
      @station.attachments.attach(@attachments)
      if @station.update(station_params)

        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
        format.html { redirect_to station_url(@station), notice: "Station was successfully updated." }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1 or /stations/1.json
  def destroy
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url, notice: "Station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_station_difficulty
    @station = Station.find(params[:id])
    @value = params[:value]

    @station.difficulty = @value
    @station.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_params
      params.require(:station).permit(:title, :context, :procedure, :evaluation, :time, :difficulty, :score, :feedback, attachments:[])
    end
end
