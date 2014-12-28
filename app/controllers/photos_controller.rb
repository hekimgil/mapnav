class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @id = params[:id]
    @p = Photo.find(@id)
    @e = Event.find(@p.event_id)
    @u = User.find(@e.user_id)
    @title = @e.title.to_s + " photo: " + @p.title.to_s
    respond_to do |format|
      format.html
      format.json {render json: {"error" => false, "message" => "",
	"photo" => @p} }
    end
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    event = Event.create(user_id: 3, createdDate: DateTime.now,
                         title: "My event", description: "My event...",
                         latitude: photo_params[:latitude],
                         longitude: photo_params[:longitude])
    @photo = Photo.new(photo_params)
    @photo.event_id = event.id
    event.title = "My event #" + @photo.id.to_s
    event.save

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:url, :thumbnail, :bitmap,
                                   :title, :description, :latitude, :longitude,
                                   :event_id, :createdDate)
    end
end
