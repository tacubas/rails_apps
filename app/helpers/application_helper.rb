module ApplicationHelper
  def menu_active(controller)
    #params[:action] == action && params[:controller] == controller ? "active" : nil
    params[:controller] == controller ? "active" : nil
  end
end
