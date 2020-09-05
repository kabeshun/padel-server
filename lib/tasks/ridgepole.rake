# frozen_string_literal: true

namespace :ridgepole do
  SCHEMA_FILE = Rails.root.join('db', 'Schemafile')
  CONFIG_FILE = ENV.fetch('DATABASE_URL') { Rails.root.join('config', 'database.yml') }
  desc 'Apply Schemafile to the database'
  task apply: :environment do
    ridgepole('--apply', '--env', Rails.env, '--file', SCHEMA_FILE)
    next unless Rails.env.development?

    ridgepole('--apply', '--env', 'test', '--file', SCHEMA_FILE)
  end

  desc 'Export the database schema to Schemafile'
  task export: :environment do
    ridgepole('--export', '--env', Rails.env, '--output', SCHEMA_FILE)
    next unless Rails.env.development?

    ridgepole('--apply', '--env', 'test', '--file', SCHEMA_FILE)
  end

  private

  def ridgepole(*options)
    command = ['bundle', 'exec', 'ridgepole', '--config', CONFIG_FILE, *options]
    sh command.join(' ')
  end
end

task raise_if_production: :environment do
  raise 'Use rake ridgepole:apply' if Rails.env.production?
end

Rake::Task['db:migrate'].enhance([:raise_if_production]) do
  Dir.glob(Rails.root.join('db', 'migrate', '*.rb')).each { |path| Pathname.new(path).delete }
  Rake::Task['ridgepole:export'].invoke
end

Rake.application.lookup('db:setup').clear
desc 'Export the database schema to Schemafile'
task 'db:setup' => %w[db:create ridgepole:apply]

Rake.application.lookup('db:schema:dump').clear
desc 'Export the database schema to Schemafile'
task 'db:schema:dump' => 'ridgepole:export'

Rake.application.lookup('db:schema:load').clear
desc 'Apply Schemafile to the database'
task 'db:schema:load' => 'ridgepole:apply'

%w[db:migrate:status db:rollback db:version].each do |name|
  Rake.application.lookup(name).clear
end
