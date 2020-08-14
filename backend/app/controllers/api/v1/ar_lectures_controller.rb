class Api::V1::ArLecturesController < ApplicationController
  
    def getAllLectures
        email = params["email"]
        password = params["password"]
        student = Student.find_by(email:email,password:password)
        lectures = student.ar_class.lectures
        render json:lectures
    end
  
  end
  