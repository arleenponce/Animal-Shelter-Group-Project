class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :pet_image]
  before_filter :authenticate_admin!, except: [:index, :show]
  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @pet = Pet.find(params[:id])
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    add_breed
    @pet.breeds << @breeds

    respond_to do |format|
      if @pet.save
        @pet = multiple_photos(@pet)
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    add_breed
    @pet.breeds << @breeds

    respond_to do |format|
      if @pet.update(pet_params)
        @pet = multiple_photos(@pet)

        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_breed
    puts '*********************'
    p params
    @pet = Pet.find(params[:pet_id])
    breed = @pet.breeds.find(params[:breed_id])

    if breed
      @pet.breeds.delete(breed)
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def pet_params
    #   params.permit(:pet)
    # end
    def pet_params
      params.require(:pet).permit(:name, :species, :gender, :age, :weight)
    end

    def multiple_photos(pet)
      if params[:photos]
        params[:photos].each do |image|
          pet.pet_images.create(photo: image)
        end
      end
      return pet
    end

    # Possible option for adding breeds to pets, as adapted from Recipes Controller
    # would be called within the create/edit method, probably
    def add_breed
      @breeds = []
      # Check to see if the breed's name exists yet, and if so, use that breed id
      breed_name_string_from_user = params[:breed][:breed_name]
      
      #i=0
      #x=find_all_tag.count
      #while i<=x do

       # x--
      #end

      @breed = Breed.find_or_create_by(breed_name: breed_name_string_from_user)
      @breeds << @breed
    end

    def find_all_tag
      @html_document.find_all(:id => "addtl_breeds")
    end

  end
