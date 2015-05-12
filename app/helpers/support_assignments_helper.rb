module SupportAssignmentsHelper
  #Produces link for creating new assignments depending on whether the user_id param is available
  def new_assignment_link
    if params[:user_id].present?
      link_to('New Support assignment', new_user_support_assignment_path)
    else
      link_to('New Support assignment', new_support_assignment_path)
    end
  end

  #Produces link for support assignments depending on wheher the user_id param is available
  def support_assignments_link
    if params[:user_id].present?
      link_to 'Back', user_support_assignments_path
    else
      link_to 'Back', support_assignments_path
    end
  end
end
