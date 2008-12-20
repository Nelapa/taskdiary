# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def show_flash
    content_tag :div, :id=> 'flash' do
   #   content_tag :div do
   #      if flash[:notice] 
   #       flash[:notice] 
   #     end
  #    end
  #    +
      content_tag :div  do
        if flash[:notice] 
          flash[:notice] 
        end
      end
    end
  end
  
  def login_logout
    content_tag :div, :id => 'login_logout'  do
      if not @current_user
        link_to 'Log in', login_users_path
      else
        link_to 'Log out', logout_users_path, :method => :delete
      end
    end
  end
  
end
