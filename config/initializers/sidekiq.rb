Sidekiq.configure_client do |config|
  Rails.application.config.after_initialize do
    LoadDataWorker.perform_async
  end
end