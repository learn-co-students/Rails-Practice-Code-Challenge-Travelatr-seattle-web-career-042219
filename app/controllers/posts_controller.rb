class PostsController < ApplicationController
        before_action :set_post, only: [:show, :edit, :update]

    def index
        @posts = Post.all 
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

    def update
        if @post.update
            redirect_to @post
        else
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
