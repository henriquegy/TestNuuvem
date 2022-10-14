# Setup

Use ```ruby '2.7.6'```

### To up enviroment
Run ```docker compose build```
Run ```docker compose up -d```

### Prepare database
Run ```rails db:migrate```

### To use oAuth2

In ```app\controllers\application_controller.rb``` uncomment the line:
-  ```before_action :authenticate_admin!```

And in file ```.env``` change env vars:
- GOOGLE_OAUTH_CLIENT_ID
- GOOGLE_OAUTH_CLIENT_SECRET

This oauth use google authentication, you have create an app in google cloud platform to this work correcly.