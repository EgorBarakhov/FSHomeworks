require 'pg'

class ToDo
  attr_reader :id, :title

  @@conn = PG.connect(dbname: 'sinatra_app', host: 'localhost', user: 'postgres',
                            password: '123')

  def initialize(params)
    @id = params['id']
    @title = params['title']
  end

  def save
    @@conn.exec("INSERT INTO todos (title) VALUES ('#{@title}') RETURNING id")
  end

  def delete
    @@conn.exec("DELETE FROM todos WHERE id=#{@id}")
  end

  def update(params)
    @@conn.exec("UPDATE todos SET title='#{params['title']}' WHERE id=#{@id}")
  end

  def self.all
    @@conn.exec("SELECT * FROM todos")
  end

  def self.where(params)
    @@conn.exec("SELECT * FROM todos WHERE id = #{params['id']}")
  end
end
