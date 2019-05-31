class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        post_finder
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = "Post saved"
            redirect_to post_path(@post)
        else
            flash[:error] = "Post was not saved"
            render :new
        end
    end

    def edit
        post_finder
    end

    def update
        post_finder
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
        flash[:success] = 'Post deleted successfully!'
        redirect_to posts_path
    end

    def add_like
        post_finder
        byebug
        @post.increment!(:likes, 1)
    end

    private

        def post_params
            params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
        end 

        def post_finder
            @post = Post.find(params[:id])
        end
end