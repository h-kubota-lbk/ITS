class SkillsheetsController < ApplicationController
  before_action :set_skillsheet, only: %i[show edit update]

  def index
    @skillsheets = Skillsheet.all
  end

  def show;end

  def print;end

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

  def edit;end

  def update
    if @skillsheet.update_attributes(skillsheet_params)
      redirect_to @skillsheet, notice: "更新しました。"
    else
      render :edit
    end
  end

  private

  def set_skillsheet
    @skillsheet = Skillsheet.find(params[:id])
  end

  def skillsheet_params
    params.require(:skillsheet).permit(Skillsheet::PERMITTED_ATTRIBUTES)
  end
end
