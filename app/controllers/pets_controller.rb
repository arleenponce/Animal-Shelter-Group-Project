class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :pet_image]

  before_filter :authenticate_admin!, except: [:index, :show, :search_pets]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  def all
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

  def search_pets
    @searched_pet = []

    if !params[:pet_search_string].nil? && !params[:pet_search_string].empty? && !params[:breed_search_string].nil? && !params[:breed_search_string].empty?
      all_pets = []

      pet_search_string = params[:pet_search_string].strip
      found_pets = Pet.search(pet_search_string)
      all_pets << found_pets

      breed_search_string = params[:breed_search_string].strip
      breed_found = Breed.search(breed_search_string)
      pet_collection = []
      breed_found.each { |b| pet_collection << b.pets.to_a }
      flat_breed_pets = pet_collection.flatten
      all_pets << flat_breed_pets
      @searched_pet = all_pets.flatten

    elsif !params[:pet_search_string].nil? && !params[:pet_search_string].empty?
      pet_search_string = params[:pet_search_string].strip
      @searched_pet = Pet.search(pet_search_string)
    elsif !params[:breed_search_string].nil? && !params[:breed_search_string].empty?
      breed_search_string = params[:breed_search_string].strip
      breed_found = Breed.search(breed_search_string)
      pet_collection = []
      breed_found.each { |b| pet_collection << b.pets.to_a }
      @searched_pet = pet_collection.flatten
        # returns active record collection, probably with only one record (but maybe not!)
        # We need to make each of these breeds accessible, and then get out each of their pets, which will then be passed to an array
        # This array (of pet objects) will then be each printed on the search view, with their name and link
    else
      @searched_pet = []
    end

    # if !params[:gender_search_string].nil? && !params[:gender_search_string].empty?
    #   gender_search_string = params[:gender_search_string].strip
    #   @searched_pet = Pet.where(
    #   "gender == '%#{gender_search_string}%'"
    #   )
    # else
    #   @searched_pet = []
    # end

    render 'search.html.erb'
  end

  def remove_breed
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
      params.require(:pet).permit(:name, :species, :gender, :age, :weight, :description)
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
      counter = 0
      while counter < 4 do
        if params[:"breed_#{counter}"] !="" && !params[:"breed_#{counter}"].nil?
          breed_name_string_from_user = params[:"breed_#{counter}"]
          breed_added = Breed.find_or_create_by(breed_name: breed_name_string_from_user)
          @breeds << breed_added
         end
          counter += 1
      end
    end

  end
