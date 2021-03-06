class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => ['public_user_index','public_user_show','slideshow']

  # GET /photos
  # GET /photos.json
  def index
      @photos = current_user.photos.all.sort { |x,y| x.dt <=> y.dt }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  def public_user_index
    @photos = User.first(conditions: { username: params[:username] }).photos.all.sort { |x,y| x.dt <=> y.dt }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  def slideshow
    @photos = User.first(conditions: { username: params[:username] }).photos.all.sort { |x,y| x.dt <=> y.dt }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = current_user.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

   # GET /photos/1
  # GET /photos/1.json
  def public_user_show
    @photo = User.first(conditions: { username: params[:username] }).photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end


  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = current_user.photos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = current_user.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = current_user.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
