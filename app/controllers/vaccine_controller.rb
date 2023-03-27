class VaccineController < ApplicationController
    def create
        @vaccine = Vaccine.new(vaccine_params)
        persona = Person.find_by(id: params[:person_id])
        @vaccine.person = persona
        if @vaccine.save
          render json: @vaccine
        else
          render json: @vaccine.errors, status: :unprocessable_entity
        end 
    end
    def index
      arr = []
      @vaccine = Vaccine.all()
      for vacin in @vaccine
        if vacin[:person_id].to_i == params[:person_id].to_i
          arr.append(vacin)
        end
      end
      render json: arr
    end
    def update
      arr = []
      @vaccine = Vaccine.find_by(id: params[:id])
      actualizar = params[:vaccine][:vaccine_date]
      @vaccine.update({:vaccine_date => actualizar})
      result = Vaccine.all()
      for vacin in result
        if vacin[:person_id].to_i == params[:person_id].to_i
          arr.append(vacin)
        end
      end
      render json: arr
    end
    def delete
      vaccine = Vaccine.find_by(id: params[:id])
      vaccine.destroy
      result = Vaccine.all()
      for vacin in result
        if vacin[:person_id].to_i == params[:person_id].to_i
          @arr.append(vacin)
        end
      end
      render json: @arr
    end
    private
      def vaccine_params
        params.require(:vaccine).permit(:vaccine_type, :vaccine_date)
      end

end
