class ChartsController < ApplicationController
  before_action :set_chart, except: [:index, :new, :create]

  def index
    @charts = Chart.all
  end

  def show
  end

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_ to charts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chart.update(chart_params)
      redirect_to charts_path
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to charts_path
end

private 
  def chart_params
    params.require(:name)
  end

  def set_chart
    @chart = Chart.find(params[:id])
  end
end
