class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show, :edit, :update]

    def index
        @bloggers = Blogger.all 
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end

    def update
        if @blogger.update
            redirect_to @blogger
        else
            render :edit
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end
end
