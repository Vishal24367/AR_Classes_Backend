ActiveAdmin.register Lecture do

  permit_params :name, :topic_name, :duration, :video_link, :ar_class_id, :user_id

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
    column 'Topic' do |topic_name|
      best_in_place topic_name, 
        :topic_name,
        as: :input, 
        url: [:admin, topic_name]
    end
    column 'Duration' do |duration|
      best_in_place duration, 
        :duration,
        as: :input, 
        url: [:admin, duration]
    end
    column 'Video Link' do |video_link|
      best_in_place video_link, 
        :video_link,
        as: :input, 
        url: [:admin, video_link]
    end
    column 'Class Name' do |ar_class|
      best_in_place ar_class, 
        :ar_class_id,
        as: :select, 
        url: [:admin, ar_class],
        :collection => ArClass.all.map{|dep| [dep.id,dep.name]}.to_h
    end
    column 'Teach By' do |user_id|
      best_in_place user_id, 
        :user_id,
        as: :select, 
        url: [:admin, user_id],
        :collection => User.all.map{|dep| [dep.id,dep.fullname]}.to_h
    end
    actions name: "Permissions"
  end

  form do |f|
    f.inputs do
      f.input :ar_class, label: 'Choose Class', as: :select, collection: ArClass.all
      f.input :name
      f.input :topic_name, label: 'Topic'
      f.input :duration
      f.input :video_link
      f.input :user_id, label: 'Teach By', as: :select, collection: User.all.map{|dep| [dep.fullname,dep.id]}.to_h
    end
    f.actions
  end

  controller do 

    def getAllLectures
      byebug
    end
  end
end
