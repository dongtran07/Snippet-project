class SnippetsController < ApplicationController
  before_action :correct_user, only: [:edit,:destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  #before_action :correct_snippet, only: :show
  def index
    if(current_user)
      @snippets= current_user.snippets.paginate(page: params[:page],:per_page => 10)
    end
  end
  def new
    @snippet= Snippet.new
  end
  def show
  end

  def create
    if current_user
     @snippet= current_user.snippets.build(snippet_params)
    else
     @snippet= Snippet.new(snippet_params)
    end
    @snippet.token = ("%d%d" % [rand(100), Time.now.to_i]).to_i.to_s(36)
    if @snippet.save
      flash[:success] = "Create snippet successful"
      redirect_to @snippet
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @snippet.update_attributes(snippet_params)
      flash[:success] = "Update snippet successful"
      redirect_to @snippet
    else
      render "edit"
    end
  end

  def destroy
    #Snippet.find(params[:id]).destroy
    @snippet.destroy
    flash[:success] = "Snippet deleted."
    redirect_to root_url
  end

  private 
    def snippet_params
      params.require(:snippet).permit(:poster,:syntax_id,:content,:private)
    end
  def correct_user
      @snippet = current_user.snippets.find_by(token: params[:id])
      redirect_to root_url if @snippet.nil?
  end
  def set_item
    @snippet = Snippet.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Wrong post it"
      redirect_to :action => 'index'
    #redirect_to action: action_name, id: @snippet.friendly_id, status: 301 unless @snippet.friendly_id == params[:id]
  end
end
