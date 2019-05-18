class SkillsheetsController < ApplicationController
  def index
    @skillsheets = Skillsheet.all
  end

  def show
    @skillsheet = Skillsheet.find(params[:id])
  end

  def print
  end

  def new
    @skillsheet = Skillsheet.new
  end

  def create
    @skillsheet = Skillsheet.new(skillsheet_params)
    if @skillsheet.save
      redirect_to skillsheets_path
    else
      render :new
    end
  end

  def edit
    @skillsheet = Skillsheet.find(params[:id])
  end

  def update
    @skillsheet = Skillsheet.find(params[:id])
  end

  private

  def skillsheet_params
    params.require(:skillsheet).permit(Skillsheet::PERMITTED_ATTRIBUTES)
  end
end
