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
            puts @post.errors.full_messages
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
            puts @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        post_finder
        if @post.destroy
            flash[:success] = 'Post deleted successfully!'
        else 
            flash[:error] = 'Post did not delete'
            puts @post.errors.full_messages
        end
        redirect_to posts_path
    end

    def add_like
        post_finder
        @post.add_like
        redirect_to post_path(@post)
    end

    private

        def post_params
            params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
        end 

        def post_finder
            @post = Post.find(params[:id])
        end
end