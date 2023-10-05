module ApplicationHelper
  def filter(type, value, text)
    query_params = request.params.merge({ dog_id: @dog.id })

    if params[type.to_sym] == value
      # link_to Inferieur à 1h, request.params.except(:duration), class: "filter-link"
      link_to query_params.except(type.to_sym), class: "filter-link active" do
        text.to_s
      end
    else
      # add d-none to class if filter icon clickable
      link_to query_params.merge(type.to_sym => value), class: "filter-link ", data: { toggle_target: "filter" } do
        text.to_s
      end
    end
  end
end
