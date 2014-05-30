namespace :delayed_job do
  task start: :environment do
    sh delayed_job, 'start'
  end

  task stop: :environment do
    sh delayed_job, 'stop'
  end

  task restart: :environment do
    sh delayed_job, 'restart'
  end

  def delayed_job
    ENV['RAILS_ENV'] ||= Rails.env
    File.join(Rails.root, 'bin', 'delayed_job')
  end
end
