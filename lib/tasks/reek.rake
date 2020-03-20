# frozen_string_literal: true

namespace :reek do
  desc 'Run reek'

  task run: :environment do
    puts 'Running reek!'
    bundle exec 'reek .'
  end
end
