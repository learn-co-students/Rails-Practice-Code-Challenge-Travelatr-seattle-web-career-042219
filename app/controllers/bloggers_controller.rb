class BloggersController < ApplicationController

  before_action :set_blogger, only: [:edit, :show, :update]

  def index
    @bloggers = Blogger.all
  end

  def new
    if flash[:blogger_attributes]
      @blogger = Blogger.new(flash[:blogger_attributes])
    else
    @blogger = Blogger.new
    end
  end

  def create
    @blogger = Blogger.new(blogger_params)

    if @blogger.save
      redirect_to @blogger
    else
      flash[:errors] = @blogger.errors.full_messages
      flash[:blogger_attributes] = @blogger.attributes

      render :new
    end
  end


  private

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
