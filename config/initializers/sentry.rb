Sentry.init do |config|
  config.dsn = 'https://f1da24148f1c192aac1e864a3c9485d3@o4506533461557248.ingest.sentry.io/4506533461688320'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end