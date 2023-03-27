class PersonController < ApplicationController
    def create
      @person = Person.new(person_params)
      if @person.save
        render json: @person
        
      else
        render json: @person.errors, status: :unprocessable_entity
      end  
    end
    def index
      @person = Person.all()
      render json: @person
    end
    def show
      @person = Person.find(params[:id])
      render json: @person
    end
    def destroy_all
      @person = Person.all()
      render json: @person
      for persona in Person.all()
        persona.destroy
      end
    end
    private
        def person_params
            params.require(:person).permit(:name)
        end
end
