Rails.application.routes.draw do
    get "/persons", to: "person#index"
    # permite registrar una persona en la base de datos
    post "/persons", to: "person#create"
    # permite recuperar los datos de una persona en base al id
    get "/persons/:id", to: "person#show"

    # permite borrar todas las personas de la base de datos 
    delete "/persons", to: "person#destroy_all"
    # permite recuperar todas las vacunas de una persona
    get "/persons/:person_id/vaccines", to: "vaccine#index"
    # permite registrar una vacuna
    post "/persons/:person_id/vaccines", to: "vaccine#create" 
    # permite actualizar la informacion de una vacuna
    patch "/persons/:person_id/vaccines/:id", to: "vaccine#update" 
    #permite recuperar la informacion de una vacuna especifica
    delete "/persons/:person_id/vaccines/:id", to: "vaccine#destroy"
end