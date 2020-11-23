class AddressesController < ApplicationController
  before_action :authenticate_user!

  # GET /addresses
  # GET /addresses.json
  def index
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
  end

  # Only allow a list of trusted parameters through.
  def address_params
  end
end
