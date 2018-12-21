class LeaguesController < ApplicationController

  def index
    @leagues = League.order('country, step')
    get_form_data
  end

  def new
    @league = League.new
    get_form_data
  end

  def create
    @league = League.new(league_params)

    if @league.save
      redirect_to leagues_path, flash: { success: I18n.t('.league.messages.created') }
    else
      get_form_data
      render action: "new"
    end
  end

  def edit
    @league = League.find(params[:id])
    get_form_data
  end

  def update
    @league = League.find(params[:id])

    if @league.update_attributes(league_params)
      redirect_to leagues_path, flash: { success: I18n.t('.league.messages.updated') }
    else
      get_form_data
      render action: "edit"
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy

    redirect_to leagues_path, flash: { success: I18n.t('.league.messages.removed') }
  end

  private

  def league_params
    params.require(:league).permit(:country, :name, :step)
  end

  def get_form_data
    @countries = League.select(:country).distinct.order('country ASC')
  end
end
