get '/' do
  @notes = Note.order("created_at DESC")
  erb :home
end

get '/note/:note_id' do 
  @note = Note.find(params[:note_id])
  erb :show_note
end

get '/create' do
  erb :create_note
end

post '/create' do
  note = Note.create(title: params[:title], description: params[:description])
  redirect "/note/#{note.id}"
end

get '/delete_confirm' do
  @note = Note.find(params[:note_id])
  erb :delete
end

post '/delete' do
  Note.find(params[:note_id]).destroy
  redirect "/"
end

get '/update' do
  @note = Note.find(params[:note_id])
  erb :update
end

post '/update' do
  Note.update(params[:note_id], :title => params[:title], :description => params[:description])
  redirect '/'
end