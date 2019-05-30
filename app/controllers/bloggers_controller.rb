class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        blogger_finder
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to blogger_path(@blog)
        else
            render :new
        end
    end

    def edit
        blogger_finder
    end

    def update
        if @blogger.update(blogger_params)
            flash[:success] = 'Blogger updated successfully!'
            redirect_to blogger_path(@blog)
        else
            flash[:error] = 'Blogger did not update'
            render :edit
        end
    end

    def destroy
        blogger_finder
        @blogger.destroy
        redirect_to bloggers_path
    end

    def total_likes
        
    end

    private

        def blogger_params
            params.require(:blogger).create(:name, :age, :bio)
        end 

        def blogger_finder
            @blogger = Blogger.find(params[:id])
        end
end