# Be sure to restart your server when you modify this file.

if Settings.key?(:memcache_servers)
  Rails.application.config.session_store :mem_cache_store, :memcache_server => Settings.memcache_servers, :namespace => "rails:session", :key => "_kl_session"
else
  Rails.application.config.session_store :cache_store, :key => "_kl_session", :cache => ActiveSupport::Cache::MemoryStore.new
end
