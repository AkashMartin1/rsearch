require 'open-uri'
require_relative '../../app/helpers/application_helper'
include ApplicationHelper

namespace :rcron do
  desc 'Run Cron'

  task go: :environment do
    MyTask.main
  end

  task url_fetch: :environment do
    MyTask.url_fetch
  end

end
