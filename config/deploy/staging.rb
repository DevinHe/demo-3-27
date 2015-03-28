role :app, %w{120.26.36.225}
role :web, %w{120.26.36.225}
role :db,  %w{120.26.36.225}

server '120.26.36.225', user: 'deploy', roles: %w{web app}, my_property: :my_value
