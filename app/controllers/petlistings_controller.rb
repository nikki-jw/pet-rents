class PetlistingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_petlisting_user, only: [:edit, :update, :destroy]

    def index
        @petlistings = Petlisting.all
    end

    def new
        set_species
        @petlisting = Petlisting.new
    end

    def create
        @petlisting = current_user.petlistings.create(petlisting_params)
        error_rerender("new")
    end

    def edit
        set_species
        if @petlisting
            render("edit")
        else  
            redirect_to petlistings_path
        end
    end

    def update
        if @petlisting
            @petlisting.update(petlisting_params)
            set_species
            error_rerender("edit")
        else 
            redirect_to petlistings_path
        end
    end

    def userpets
        @petlistings = current_user.petlistings
    end

    def show
        @petlisting = Petlisting.find(params["id"])
    end

    def destroy
        if @petlisting
            @petlisting.destroy
        end
        redirect_to petlistings_path
    end

    private

    def set_petlisting_user
        @petlisting = current_user.petlistings.find_by_id(params[:id])

        if @petlisting == nil
            redirect_to listings_path
        end
    end

    def set_species
        @species = Species.all
    end

    def petlisting_params
        params.require(:petlisting).permit(:title, :description, :species_id, :picture)
    end

    def error_rerender(view)
        if @petlisting.errors.any?
            render view
        else
            redirect_to petlistings_path
        end
    end
    
end
