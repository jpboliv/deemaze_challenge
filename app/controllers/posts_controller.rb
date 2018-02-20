class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def show
    end

    def new
        @post = current_user.posts.build
        @owners = User.all
    end
    
    def edit
        @owners = User.all
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            #Create the notifications
            user = @post.owner
            @user = User.find_by_name(user)
            puts @user.name
            puts current_user.id
            Notification.create(recipient: @user, actor: current_user, action: "posted", notifiable: @post)
            redirect_to @post
        else
            render 'new'
        end
    end

    def update 
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

   
    
    private 
    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title,:description,:owner)
    end
end
