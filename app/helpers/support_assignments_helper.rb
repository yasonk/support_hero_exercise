module SupportAssignmentsHelper
  def new_assignment_link
    if params[:user_id].present?
      link_to('New Support assignment', new_user_support_assignment_path)
    else
      link_to('New Support assignment', new_support_assignments_path)
    end
  end

  def support_assignments_link
    if params[:user_id].present?
      link_to 'Back', user_support_assignments_path
    else
      link_to 'Back', support_assignments_path
    end
  end
end
