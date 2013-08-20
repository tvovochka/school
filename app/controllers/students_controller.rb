# coding: utf-8
class StudentsController < ApplicationController
  
  def index

    filter = []
    group_filter = []


    if !params[:name].blank?
      name = params[:name]
      filter << ["name LIKE '%#{name}%'"]
    end

    if !params[:secondname].blank?
      secondname = params[:secondname]
      filter << ["secondname LIKE '%#{secondname}%'"]
    end

    if !params[:study_group_id].blank?
      groupid = params[:study_group_id]
      filter << ["study_group_id = #{groupid.to_i}"]
    end

    if !params[:semestr].blank?
      semestr = params[:semestr]
      group_filter << ["study_groups.semestr = #{semestr.to_i}"]
    end

    if !params[:average_start].blank? or !params[:average_end].blank?
      average_start = params[:average_start].blank? ? 0 : params[:average_start]
      average_end = params[:average_end].blank? ? 100 : params[:average_end]
      filter << ["average BETWEEN #{average_start.to_i} AND #{average_end.to_i}"]
    end
    
    if !params[:ipreg].blank?
      filter << ["ipreg IN (SELECT ipreg FROM students GROUP BY ipreg HAVING COUNT(ipreg) > 1)"]
    end    

    unless params[:characteristic].blank?
      group_filter << ["study_groups.characteristic > ''"]
    end

    sql_where = Student.sanitize_str(filter.join(" AND "))
    sql_group_where = Student.sanitize_str(group_filter.join(" AND "))
    @students = Student.where(sql_where).includes(:study_group, :evaluation).where(sql_group_where).order('average DESC').limit(10)
    @student = Student.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def create
    @student = Student.new(params[:student])
    @student.ipreg = request.remote_ip
    @student.average = 5
   
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Студент был успешно добавлен.' }
        format.js   {}
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @student = Student.find(params[:id])
    respond_to do |format|
      #format.html
      format.js
    end
  end

  def update
    @student = Student.find(params[:id])
    @students = Student.includes(:study_group, :evaluation).order('average DESC').limit(10)

    respond_to do |format|
      # if @student.updated_at == params[:student][:updated_at]
      if @student.valid? and @student.update_attributes(params[:student])
        #format.html { redirect_to students_path, :notice => 'Информаци о студенте успешно изменена.' }
        format.js 
      else
        format.html { render :action => "edit" }
      end
    # rescue ActiveRecord::StaleObjectError
    #   @student.reload
    #   render :action => 'edit'
      # else
      #   format.html { render :action => "edit", :notice => 'Информация о студенте была изменена другим пользователем.' }
      # end
    end    
  end
end
