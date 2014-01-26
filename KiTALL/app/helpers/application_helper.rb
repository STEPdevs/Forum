module ApplicationHelper
	def error field, resource
  	resource.errors[field][0]
  end
end
