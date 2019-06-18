class PitchesController < ApplicationController

    get "/pitches" do
        @pitches = Pitch.all
        erb :index
    end

    get "/pitches/new" do
        erb :new
    end

    post "/search" do
        @industry = params[:industry]
        @pitches = Pitch.select {|pitch| pitch.industry == @industry}
        erb :industry
    end

    post "/pitches" do
        new_pitch = Pitch.create(params)
        redirect "/pitches/#{new_pitch.id}"
    end

    get "/pitches/:id" do
        @pitch = Pitch.find(params[:id])
        erb :show
    end

    get "/pitches/:id/edit" do
        @pitch = Pitch.find(params[:id])
        erb :edit
    end

    patch "/pitches/:id" do 
        pitch = Pitch.find(params[:id])
        title = params[:title]
        industry = params[:industry]
        funding = params[:funding]
        pitch.update(title: title, industry: industry, funding: funding)
        redirect "/pitches/#{pitch.id}"
    end 

    delete "/pitches/:id/delete" do
        pitch = Pitch.find(params[:id])
        pitch.delete
        redirect "/pitches"
    end    

end