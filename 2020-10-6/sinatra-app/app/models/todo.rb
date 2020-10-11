require 'pg'

class ToDo
  attr_reader :id, :title

  def initialize
    @conn = PG.connect(dbname: 'sinatra_app', host: 'localhost', user: 'postgres',
                       password: '123')
  end

  def save(title)
    @conn.exec("INSERT INTO todos (title) VALUES ('#{title}') RETURNING id")
  end

  def save!
    save @title
  end

  def delete(id)
    @conn.exec("DELETE FROM todos WHERE id=#{id}")
  end

  def delete!
    delete @id
  end

  def update(id, title)
    @conn.exec("UPDATE todos SET title='#{title}' WHERE id=#{id}")
  end

  def update!
    update(@id, @title)
  end

  def self.where(params)
    id = params['id']
    pattern = params['pattern']
    if id.equal? nil
      response = "SELECT * FROM todos WHERE title LIKE '%#{pattern}%'"
    elsif pattern.equal? nil
      response = "SELECT * FROM todos WHERE id = #{id}"
    else
      response = "SELECT * FROM todos WHERE id = #{id} AND title LIKE '%#{pattern}%'"
    end
    response
  end
end
