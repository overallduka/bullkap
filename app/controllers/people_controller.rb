class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @people = Person.order(:name).page params[:page]
    respond_with @people
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def read_xls
    xls = Roo::Excelx.new(params[:file]['file'].tempfile.path,nil, :ignore)

    xls.default_sheet = xls.sheets.first
    city = ''
    courses = []
    adds = 0
    fails = 0

    xls.first_row.upto(xls.last_row) do |i|

      if xls.cell(i,1).present? && xls.cell(i,2).blank? && xls.cell(i,3).blank? && xls.cell(i,4).blank? # CITY
        city = xls.cell(i,1)
      elsif xls.cell(i,1).present? && xls.cell(i,1).downcase != 'nome' # PERSON
        courses << xls.cell(i,4) if xls.cell(i,4).present? && courses.include?(xls.cell(i,4)) == false
        person = Person.new(name: xls.cell(i,1), cell_number: xls.cell(i,2), email: xls.cell(i,3))
        if person.save
          adds += 1
        else
          fails += 1
        end

        in_courses = xls.cell(i,4).present? ? xls.cell(i,4).split('/') : []
        in_courses = Interest.get_or_create(in_courses)
        person.interests << in_courses

      end

    end

    redirect_to people_path, notice: "Inseridas #{adds} pessoas, #{fails} pessoas não foram inseridas por email ou celular repetidos"

  end

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

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :email, :phone_number, :cell_number, :twitter, :facebook, :instagram, :bond_id)
    end
end
