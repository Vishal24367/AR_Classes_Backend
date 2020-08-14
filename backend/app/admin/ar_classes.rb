ActiveAdmin.register ArClass do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :strength, :organization_id, :department_id, :configurations

  index do
    selectable_column
    column "Sr. No." do |ar_class|
      ar_class.id
    end
    column "Name" do |name|
      best_in_place name, 
        :name,
        as: :input, 
        url: [:admin, name]
    end
    column :strength do |strength|
      best_in_place strength, 
        :strength,
        as: :select, 
        url: [:admin, strength]
    end
    column :organization do |organization|
      best_in_place organization, 
        :organization_id,
        as: :select, 
        url: [:admin, organization],
        :collection => Organization.all.map{|dep| [dep.id,dep.name]}.to_h
    end
    column :department do |department|
      best_in_place department, 
        :department_id,
        as: :select, 
        url: [:admin, department],
        :collection => Department.all.map{|dep| [dep.id,dep.name]}.to_h
    end
    actions name: "Permissions"
  end
  
end
