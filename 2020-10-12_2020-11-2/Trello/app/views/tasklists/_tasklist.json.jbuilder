json.extract! tasklist, :id, :title, :created_at, :updated_at
json.url tasklist_url(tasklist, format: :json)
