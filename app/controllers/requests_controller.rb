class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:index, :add]

    # GET /requests
    def index
        @requests = Request.all
      if params[:status]
        if params[:status] != 'all'
          @requests = @requests.where(status: params[:status])
        end
      else
        @requests = @requests.to_add
      end
    end

    # GET /requests/1
    def show
    end

    # GET /requests/new
    def new
        @request = Request.new
    end

    # GET /requests/1/edit
    def edit
    end

    def add
      @request = Request.find(params[:request_id])
      @request.update_attribute :status, 'added'
      redirect_to admin_path
    end

    def lookup
      if params[:reddit_username].present? && params[:minecraft_username].present?
        @request = Request.where(reddit_username: params[:reddit_username],
                                 minecraft_username: params[:minecraft_username]).first
      end
    end

    # POST /requests
    def create
        @request = Request.new(request_params)

        if @request.save
            redirect_to thanks_path
        else
            render :new
        end
    end

    # PATCH/PUT /requests/1
    def update
        if @request.update(request_params)
            redirect_to @request, notice: 'Request was successfully updated.'
        else
            render :edit
        end
    end

    # DELETE /requests/1
    def destroy
        @request.destroy
        redirect_to requests_url, notice: 'Request was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
        @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
        params.require(:request).permit(:reddit_username, :minecraft_username, :status, :comment)
    end
end
