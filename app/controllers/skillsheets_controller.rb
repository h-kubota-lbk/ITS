class SkillsheetsController < ApplicationController
  before_action :set_skillsheet, only: %i[show edit update]

  def index
    @skillsheets = Skillsheet.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'skillsheet',
               layout: 'pdf.slim',
               template: 'skillsheets/show.pdf.slim',
               encoding: 'UTF-8'
      end
    end
  end

  def print; end

  def new
    @user = User.find(params[:user_id])
    @skillsheet = Skillsheet.new
    @skillsheet.work_contents.build
  end

  def create
    @skillsheet = Skillsheet.new(skillsheet_params)
    if @skillsheet.save
      redirect_to skillsheets_path, notice: '登録しました。'
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def edit; end

  def update
    if @skillsheet.update(skillsheet_params)
      redirect_to @skillsheet, notice: '更新しました。'
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
