ActiveAdmin.register AdminUser do

  before_filter :authorize_this

  controller do

    def authorize_this
      authorize! :manage, AdminUser
    end

  end

  menu :label => "User management", :if => proc { can? :manage, AdminUser }

  index do
    column :email
    column :role
    default_actions
  end

  filter :email
  filter :role

  form do |f|
    f.inputs do
      f.input :email
      f.input :role, :as => :select, :collection => AdminUser::ROLES
    end
    f.buttons
  end

end
