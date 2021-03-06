class CalendarsController < ApplicationController
  include CalendarsHelper

  before_action :set_calendar, only: %i[ show edit update destroy ]

  # GET /calendars or /calendars.json
  def index
    @calendars = Calendar.all
  end

  # GET /calendars/1 or /calendars/1.json
  def show
    # TODO Add a checkbox to toggle viewing:
      # completable: true/false/all
      # completed: true/false/all
      # colors: blue/yellow/.../all
    @events = Event.where(calendar_id: @calendar.id)
                   .not_completed
                   .where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
                   .decorate

    # Check if an old ID was used to reference the calendar, and redirect to the new location.
    if request.path != calendar_path(@calendar)
      redirect_to @calendar, status: :moved_permanently
    end
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
    # Check if an old ID was used to reference the calendar, and redirect to the new location.
    if request.path != edit_calendar_path(@calendar)
      redirect_to @calendar, status: :moved_permanently
    end
  end

  # POST /calendars or /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user = current_user

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: "Calendar was successfully created." }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1 or /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: "Calendar was successfully updated." }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1 or /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: "Calendar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.friendly.find(params[:id]).decorate
  end

  # Only allow a list of trusted parameters through.
  def calendar_params
    params.require(:calendar).permit(:user_id, :name, :description)
  end
end
