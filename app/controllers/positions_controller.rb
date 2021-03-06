class PositionsController < ApplicationController

  # GET /positions
  # GET /positions.json
  def index
    if is_admin?
      @positions = Position.all
    else
      @positions = current_user.positions
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions }
    end
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    @position = Position.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @position = Position.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.json
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :no_content }
    end
  end

  def save
    unless request.post?

      respond_to do |format|
        format.html { render action: "save" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
        format.mobile do
          render :action => 'save', :formats => 'html', :layout => 'application.mobile.erb'
        end
      end
    else
      @position = Position.new(:user_id => @current_user.id, :lat => params[:coords][ :latitude ], :long => params[:coords][ :longitude ], :altitude => params[:coords][ :altitude ], :accuracy => params[:coords][ :accuracy ], :altitude_accuracy => params[:coords][ :altitude_accuracy ], :timestamp => params[ :timestamp ])
      logger.debug "-- params[ :timestamp]:#{params[ :timestamp ]}"
      @position.save
      respond_to do |format|
        format.html { render action: "save" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
        format.mobile do
          render :action => 'save', :formats => 'html', :layout => 'application.mobile.erb'
        end
      end
    #redirect_to position_path(@position)
    end
  end
end
