require 'pusher'

Pusher.url = "http://"+ Rails.application.secrets.pusher_key + ":"+ Rails.application.secrets.pusher_secret+"@api.pusherapp.com/apps/"+Rails.application.secrets.pusher_app_id.to_s
Pusher.logger = Rails.logger