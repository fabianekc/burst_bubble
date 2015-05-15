include ActionView::Helpers::NumberHelper

module Api
  class BaseController < ApplicationController
#    protect_from_forgery with: :null_session
    skip_before_filter :verify_authenticity_token
    before_action :set_resource, only: [:destroy, :show, :update]
    respond_to :json

    # POST /api/{plural_resource_name}
    def create
      set_resource(resource_class.new(resource_params))

      if get_resource.save
        render :show, status: :created
      else
        render json: get_resource.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/{plural_resource_name}/1
    def destroy
      get_resource.destroy
      head :no_content
    end

    # GET /api/{plural_resource_name}
    def index
      set_resource(resource_class.new(resource_params))
      get_resource.request_ip = request.remote_ip
      get_resource.request_header = request.env['HTTP_USER_AGENT']
      if get_resource.save
        Log.create(description:"submit", log_class:2,
                   log_objects:"[event: 'data submitted', repo: '" +
                      resource_params[:vat].to_s + "', value: '" +
                      resource_params[:value].to_s + "']")
        @vat = resource_params[:vat]
        @responses = Response.where(vat: @vat).where.not(value: "na")
        @respLast = resource_params[:value]
        @respCnt = @responses.count
        @respAvg = @responses.pluck(:value).inject(0){ |sum, val|
          sum.to_f+val.to_f }.to_f / @respCnt
        respond_to do |format|
          format.js { render :json =>
		                    {:piaSubmission => @respLast.to_s,
		                     :piaResponseTxt => "hello world",
                         :piaVat => @vat}.to_json,
		                  :callback => params[:callback] }
          format.html { render json: {:piaResponse => "text"}}
        end
      else
        respond_to do |format|
          format.js { render action: 'error' }
          format.html { render :show, status: :unprocessable_entity }
        end
      end
#      plural_resource_name = "@#{resource_name.pluralize}"
#      resources = resource_class.where(query_params)
#                                .page(page_params[:page])
#                                .per(page_params[:page_size])
#
#      instance_variable_set(plural_resource_name, resources)
#      respond_with instance_variable_get(plural_resource_name)
    end

    # GET /api/{plural_resource_name}/1
    def show
      respond_with get_resource
    end

    # PATCH/PUT /api/{plural_resource_name}/1
    def update
      if get_resource.update(resource_params)
        render :show
      else
        render json: get_resource.errors, status: :unprocessable_entity
      end
    end

    private

      # Returns the resource from the created instance variable
      # @return [Object]
      def get_resource
        instance_variable_get("@#{resource_name}")
      end

      # Returns the allowed parameters for searching
      # Override this method in each API controller
      # to permit additional parameters to search on
      # @return [Hash]
      def query_params
        {}
      end

      # Returns the allowed parameters for pagination
      # @return [Hash]
      def page_params
        params.permit(:page, :page_size)
      end

      # The resource class based on the controller
      # @return [Class]
      def resource_class
        @resource_class ||= resource_name.classify.constantize
      end

      # The singular name for the resource class based on the controller
      # @return [String]
      def resource_name
        @resource_name ||= self.controller_name.singularize
      end

      # Only allow a trusted parameter "white list" through.
      # If a single resource is loaded for #create or #update,
      # then the controller for the resource must implement
      # the method "#{resource_name}_params" to limit permitted
      # parameters for the individual model.
      def resource_params
        @resource_params ||= self.send("#{resource_name}_params")
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_resource(resource = nil)
        resource ||= resource_class.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
      end
  end
end
