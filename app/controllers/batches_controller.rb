class BatchesController < ApplicationController
  before_action :set_batch, only: %i[ show edit update destroy show_batch ]

  # GET /batches or /batches.json
  def index
    @batches = Batch.all
    @title = 'All Batches'
  end

  # GET /batches/1 or /batches/1.json
  def show
    @title = "Batch #{@batch.id}"
  end

  def show_batch

  end

  # GET /batches/new
  def new
    @batch = Batch.new
    @title = "New Batch"
  end

  # GET /batches/1/edit
  def edit
    @title = "Edit Batch #{@batch.id}"
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:batch_no)
    end
end
