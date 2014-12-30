class ArtsController < ApplicationController
  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      redirect_to arts_path, success: "Art has been uploaded"
    else
      flash.now[:danger] = "Failed"
      render 'new'
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update(art_params)
      redirect_to arts_path, success: "Art has been uploaded"
    else
      flash.now[:danger] = "Failed"
      render 'new'
    end
  end

  def index
    @arts = Art.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @art = Art.find(params[:id])
  end

  def destroy
    art = Art.find(params[:id])
    art.destroy
    flash[:notice] = "Art has been destroyed"
    redirect_to arts_path
  end

  private

  def art_params
    params.require(:art).permit(:image, :category, :source, :name)
  end
end
