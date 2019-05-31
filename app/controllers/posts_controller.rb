class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        post_finder
    end

    def new
        @Post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def edit
        post_finder
    end

    def update
        if @post.update(post_params)
            flash[:success] = 'Post updated successfully!'
            redirect_to post_path(@post)
        else
            flash[:error] = 'Post did not update'
            render :edit
        end
    end

    def destroy
        post_finder
        @post.destroy
        redirect_to posts_path
    end

    private

        def post_params
            params.require(:post).create()
        end 

        def post_finder
            @Post = Post.find(params[:id])
        end
end