ActiveAdmin.register Student do

  permit_params :name, :email, :password, :phone_no, :organization_id, :department_id, :ar_class_id

  index do 
    selectable_column
    column "Sr. No." do |stu|
      stu.id
    end
    column "Name" do |name|
      best_in_place name, 
        :name,
        as: :input, 
        url: [:admin, name]
    end
    column "Email" do |email|
      best_in_place email, 
        :email,
        as: :input, 
        url: [:admin, email]
    end
    column "Password" do |password|
      best_in_place password, 
        :password,
        as: :input, 
        url: [:admin, password]
    end
    column "Password" do |phone_no|
      best_in_place phone_no, 
        :phone_no,
        as: :input, 
        url: [:admin, phone_no]
    end
    column 'School' do |organization|
      best_in_place organization, 
        :organization_id,
        as: :select, 
        url: [:admin, organization],
        :collection => Organization.all.map{|org| [org.id,org.name]}.to_h
    end
    column 'Department' do |department_id|
      best_in_place department_id, 
        :department_id,
        as: :select, 
        url: [:admin, department_id],
        :collection => Department.all.map{|org| [org.id,org.name]}.to_h
    end
    column 'Class Name' do |ar_class_id|
      best_in_place ar_class_id, 
        :ar_class_id,
        as: :select, 
        url: [:admin, ar_class_id],
        :collection => ArClass.all.map{|org| [org.id,org.name]}.to_h
    end
    actions name: "Permissions"
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :phone_no, label: 'Contact No.'
      f.input :organization_id, label: 'Choose School', as: :select, collection: Organization.all
      f.input :department_id, as: :select, collection: Department.all
      f.input :ar_class_id, label: 'Choose Class', as: :select, collection: ArClass.all
    end
    f.actions
  end
end
