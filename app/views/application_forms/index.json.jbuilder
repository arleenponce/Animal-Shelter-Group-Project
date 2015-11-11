json.array!(@application_forms) do |application_form|
  json.extract! application_form, :id, :name, :phone, :email, :street_address, :city, :state, :zip, :information
  json.url application_form_url(application_form, format: :json)
end
