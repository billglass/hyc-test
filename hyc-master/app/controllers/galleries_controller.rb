class GalleriesController < ApplicationController
	
	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Gallery.create(gallery_params)
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
end 
private 

def gallery_params
  params.require(:id).permit(:avatar)
end

