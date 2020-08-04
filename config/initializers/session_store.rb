# Be sure to restart your server when you modify this file.

#if Settings.key?(:memcache_servers)
#  Rails.application.config.session_store :mem_cache_store, :memcache_server => Settings.memcache_servers, :namespace => "rails:session", :key => "_kl_ed_sessn"
#else
  Rails.application.config.session_store :cache_store, :key => "_kl_ed_sessn", :cache => ActiveSupport::Cache::MemoryStore.new
#end
#
#Rails.application.config.session_store :cookie_store, :key => "_kl_ed_sess"
