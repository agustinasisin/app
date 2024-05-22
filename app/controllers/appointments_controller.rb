class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.all
    @treatments = Treatment.all
    @appointments = @appointments.joins(:patient).where("patients.first_name LIKE :filter OR patients.last_name LIKE :filter", filter: "%#{params[:filter]}%") unless params[:filter].blank?
    @appointments = @appointments.where(:clinic_id => params[:clinic_id]) unless params[:clinic_id].blank?

    @patient_id = params[:patient_id]
    @clinic_id = params[:clinic_id]
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    puts params.inspect
    @appointment = Appointment.new(appointment_params)
    @appointment.build_payment(payment_params)

    respond_to do |format|
      if appointment_available? && @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:date, :hour, :patient_id, :professional_id, :clinic_id, :treatment_id, payment_attributes: [:amount, :payment_method, :datetime])
    end

    def payment_params
      params.require(:appointment).require(:payment).permit(:amount, :payment_method, :datetime)
    end

    def appointment_available?
      appointment_duration = @appointment.treatment.duration.minutes
      appointment_end_time = @appointment.hour + appointment_duration
      
      appointments_at_same_date = Appointment.where(date: @appointment.date)

      appointments_at_same_date.none? do |existing_appointment|
        existing_appointment_duration = existing_appointment.treatment.duration.minutes
        existing_appointment_end_time = existing_appointment.hour + existing_appointment_duration

        existing_appointment_end_time > @appointment.hour && existing_appointment.hour < appointment_end_time
      end
    end
end
