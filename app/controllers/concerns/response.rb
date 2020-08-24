module Response
  def json_response(obj=[], serializer:nil, each_serializer:nil, status: :ok)
    render json: obj,
           serializer: serializer,
           each_serializer: each_serializer,
           status: status
  end
end