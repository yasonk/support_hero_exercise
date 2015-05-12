class SupportAssignmentsController < ApplicationController
  before_action :set_support_assignment, only: [:show, :edit, :update, :destroy]

  # GET /support_assignments
  # GET /support_assignments.json
  def index
    if params[:user_id].present?
      @support_assignments = SupportAssignment.where(user_id: params[:user_id]).order :date
    else
      @support_assignments = SupportAssignment.all.order :date
    end
  end

  # GET /support_assignments/1
  # GET /support_assignments/1.json
  def show
  end

  # GET /support_assignments/new
  def new
    @support_assignment = SupportAssignment.new
  end

  # GET /support_assignments/1/edit
  def edit
  end

  # POST /support_assignments
  # POST /support_assignments.json
  def create
    @support_assignment = SupportAssignment.new(support_assignment_params)

    respond_to do |format|
      if @support_assignment.save
        format.html { redirect_to [@support_assignment.user, @support_assignment], notice: 'Support assignment was successfully created.' }
        format.json { render :show, status: :created, location: @support_assignment }
      else
        format.html { render :new }
        format.json { render json: @support_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_assignments/1
  # PATCH/PUT /support_assignments/1.json
  def update
    respond_to do |format|
      if @support_assignment.update(support_assignment_params)
        format.html { redirect_to [@support_assignment.user, @support_assignment], notice: 'Support assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@support_assignment.user, @support_assignment] }
      else
        format.html { render :edit }
        format.json { render json: @support_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_assignments/1
  # DELETE /support_assignments/1.json
  def destroy
    @support_assignment.destroy
    respond_to do |format|
      format.html { redirect_to support_assignments_url, notice: 'Support assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /support_assignments/today
  # GET /support_assignments/today.json
  def today
    @support_assignment = SupportAssignment.where(date: Date.today).first
    render :show
  end

  # GET /support_assignments/month/1
  # GET /support_assignments/month/1.json
  def month
    @support_assignments = SupportAssignment.where("strftime('%m', date) + 0 = ?", params[:month].to_i).order :date
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_assignment
      @support_assignment = SupportAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_assignment_params
      params.require(:support_assignment).permit(:date, :user_id)
    end
end
