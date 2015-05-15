module Api
  class ResponsesController < Api::BaseController

    private

      def response_params
        params.require(:response).permit(
          :quest_id,
          :author,
          :value,
          :confidence,
          :comment,
          :context,
          :vat,
          :request_ip,
          :request_header,
          :session_id)
      end

      def query_params
        params.permit(:query_id, :value)
      end

  end
end
