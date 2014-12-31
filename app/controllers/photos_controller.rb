class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
    respond_to do |format|
      format.html
      format.json {render json: {"error" => false, "message" => "",
	"photos" => @photos} }
    end
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
    userid = 1
    u = User.find(userid)
    uname = u.firstName
    closest_event = -1
    distance_event = 0
    plat = BigDecimal(photo_params[:latitude])
    plon = BigDecimal(photo_params[:longitude])
    Event.where(:user_id => userid).each do |event|
      d = distance(plat, plon, event.latitude, event.longitude)
      if (closest_event == -1) or (d < distance_event) then
        closest_event = event.id
        distance_event = d
      end
    end
    @photo = Photo.new(photo_params)
#    @photo.title = photo_params[:title]
#    @photo.description = photo_params[:description]
#    @photo.latitude = photo_params[:latitude]
#    @photo.longitude = photo_params[:longitude]
#    @photo.createdDate = photo_params[:createdDate]
    if photo_params[:thumbnail] == "" then @photo[:thumbnail] = photo_params[:url] end
    if (closest_event != -1) and (distance_event <= 500) then
      event = Event.find(closest_event)
    else
      event = Event.create(user_id: userid, createdDate: photo_params[:createdDate],
                           title: uname + "'s event", description: uname + "'s event...",
                           latitude: photo_params[:latitude],
                           longitude: photo_params[:longitude],
                           thumbnail: @photo[:thumbnail])
    end
#    @photo = Photo.new(photo_params)
    @photo.event_id = event.id
    savestatus = @photo.save

    respond_to do |format|
      if savestatus
        event.title = uname + "'s event #" + Event.where(:user_id => event.user_id).count.to_s
        if event.thumbnail == nil then event.thumbnail = @photo.thumbnail end
        event.save
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
