class SelectionsController < ApplicationController
  skip_before_filter :require_user, :only => [:show]
  layout "selectionshow", :only => [:show]

  # GET /selections
  # GET /selections.json
  def index
    @selections = []
    Selection.all.each do |selection|
      if selection.user != nil
        if selection.user.email == @current_user.email
        @selections.push(selection)
        end
      end 
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selections }
    end
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
    @selection = Selection.find_by_name(params[:id].sub("-", " "))
    @current_user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection }
    end
  end

  # GET /selections/new
  # GET /selections/new.json
  def new
    @selection = Selection.new
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection }
    end
  end

  # GET /selections/1/edit
  def edit
    @selection = Selection.find_by_name(params[:id].sub("-", " "))
    @restaurants = Restaurant.all
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(params[:selection])
    @selection.user=@current_user
    @current_user.selections.push(@selection)
    params[:display].each do |key, val|
      if val != "0"
        @selection.restaurants.push(Restaurant.find(key))
      end
    end

    respond_to do |format|
      if @selection.save
        format.html { redirect_to @selection, notice: 'Selection was successfully created.' }
        format.json { render json: @selection, status: :created, location: @selection }
      else
        format.html { render action: "new" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selections/1
  # PUT /selections/1.json
  def update
    @selection = Selection.find_by_name(params[:id].sub("-", " "))
    @selection.restaurants = {}
    params[:display].each do |key, val|
      if val != "0"
        @selection.restaurants.push(Restaurant.find(key))
      end
    end



    respond_to do |format|
      if @selection.update_attributes(params[:selection])
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection = Selection.find_by_name(params[:id].sub("-", " "))
    @selection.destroy

    respond_to do |format|
      format.html { redirect_to selections_url }
      format.json { head :no_content }
    end
  end
end
