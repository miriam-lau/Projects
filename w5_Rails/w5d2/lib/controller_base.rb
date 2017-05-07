require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @res = res
    @req = req
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Double render error" if already_built_response?
    @res.location = url
    @res.status = 302
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Double render error" if already_built_response?
    @res.write(content)
    @res['Content-Type'] = content_type
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    raise "Double render error" if already_built_response?
    directory_path = File.dirname(__FILE__)
    #filename = "#{directory_path}/../views/#{self.class.name_underscore}/#{template_name.to_s}.html.erb"
    #filename = "#{directory_path}/../views/".*_controller"/#{template_name.to_s}.html.erb"
    filename = "#{directory_path}/../views/cats_controller/#{template_name.to_s}.html.erb"
    erb = ERB.new(File.read(filename)).result(binding)
    render_content(erb, 'text/html')
    @already_built_response = true
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
