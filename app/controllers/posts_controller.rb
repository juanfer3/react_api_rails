class PostsController < ApplicationController
    #before_action :authenticate_user,  only: [:index]
    before_action :set_post, only: [:show, :update, :destroy]

    def index
        @posts = Post.all
        render json: @posts,  include: 'articles'
    end

    def show
        render json: @post
    end

    def create
        
        @post = Post.new(post_params)
        #@post.articles.build
        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.erros, status: :unprocessable_entity
        end
    end

    def update
        puts "===========entra al editor ========="
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.erros, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:id, :title, :description,
                articles_attributes:[:id,:_destroy,:information]
            )
        end
        
        def authorize
            return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
        end
    end
