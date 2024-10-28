Rails.application.routes.draw do
  root "todo#index"

   # List all tasks and show a specific task
   get "/tasks", to: "todo#index"
   get "/tasks/new", to: "todo#new"  
   get "/tasks/:id", to: "todo#show", as: "task"
   get "/tasks/:id/edit", to: "todo#edit", as: "edit_task"
 
   # Routes for creating, updating, and deleting tasks
   post "/tasks", to: "todo#create"            # Create a new task
   patch "/tasks/:id", to: "todo#update"       # Update an existing task
   put "/tasks/:id", to: "todo#update"         # Alias for update
   delete "/tasks/:id", to: "todo#destroy"  
end