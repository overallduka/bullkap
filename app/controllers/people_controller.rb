class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  def read_xls
    require 'remote_table'
    xls = Roo::Excelx.new(params[:file].path,nil, :ignore)

    #a = RemoteTable.new(b, format: :xlsx)
    xls.default_sheet = xls.sheets.first
    city = ''
    courses = []
    adds = 0
    xls.first_row.upto(xls.last_row) do |i|

      if xls.cell(i,1).present? && xls.cell(i,2).blank? && xls.cell(i,3).blank? && xls.cell(i,4).blank? # CITY
        city = xls.cell(i,1)
      elsif xls.cell(i,1).present? && xls.cell(i,1).downcase != 'nome' # PERSON
        courses << xls.cell(i,4) if xls.cell(i,4).present? && courses.include?(xls.cell(i,4)) == false
        person = Person.new(name: xls.cell(i,1), cell_number: xls.cell(i,2), email: xls.cell(i,3))
        person.save(:validate => false)
        adds += 1

        in_courses = xls.cell(i,4).present? ? xls.cell(i,4).split('/') : []
        in_courses = Interest.get_or_create(in_courses)
        person.interests << in_courses

      end

    end
    response = { :count => adds }
    respond_to do |format|
      format.json { render response }
    end


  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.phone_number = @person.phone_number.scan(/\d+/).join if @person.phone_number.present?
    @person.cell_number = @person.cell_number.scan(/\d+/).join if @person.cell_number.present?
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :email, :phone_number, :cell_number, :twitter, :facebook, :instagram, :bond_id)
    end
end
