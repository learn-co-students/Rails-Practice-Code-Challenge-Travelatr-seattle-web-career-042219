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
            flash[:success] = 'Blogger saved successfully!'
            redirect_to blogger_path(@blogger)
        else
            flash[:error] = 'Blogger did not save'
            render :new
        end
    end

    def edit
        blogger_finder
    end

    def update
        blogger_finder
        if @blogger.update(blogger_params)
            flash[:success] = 'Blogger updated successfully!'
            redirect_to blogger_path(@blogger)
        else
            flash[:error] = 'Blogger did not update'
            render :edit
        end
    end

    def destroy
        blogger_finder
        @blogger.destroy
        flash[:success] = 'Blogger deleted successfully!'
        redirect_to bloggers_path
    end

    private

        def blogger_params
            params.require(:blogger).permit(:name, :age, :bio)
        end 

        def blogger_finder
            @blogger = Blogger.find(params[:id])
        end
end