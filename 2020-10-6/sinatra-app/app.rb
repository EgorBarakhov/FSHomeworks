require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'byebug'

require './app/models/todo'

configure {set :server, :puma}

set :views, settings.root + '/app/views'

conn = PG.connect(dbname: 'sinatra_app', host: 'localhost', user: 'postgres',
                  password: '123')

get '/' do
  "Hello world!"
end

get "/todos" do
  @result = conn.exec("SELECT * FROM todos")

  erb :index
end

get "/todos/filter" do
  @result = conn.exec(ToDo.where(params))

  erb :index
end

get "/todos/new" do
  erb :new
end

get "/todos/:id/edit" do
  @result = conn.exec("SELECT * FROM todos WHERE id=#{params['id']}")[0]

  erb :edit
end

get "/todos/:id" do
  @result = conn.exec("SELECT * FROM todos WHERE id=#{params['id']}")[0]

  erb :show
end

post "/todos" do
  if params["custom_method"] == "DELETE"
    @result = ToDo.new.delete params['id']

    redirect to("/todos")
  else
    @result = ToDo.new.save params['title']

    redirect to("/todos/#{@result[0]['id']}")
  end
end

post "/todos/:id" do
  if params["custom_method"] == "PUT"
    @result = ToDo.new.update(params['id'],params['title'])

    redirect to("/todos/#{params['id']}")
  end
end
