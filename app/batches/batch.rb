# frozen_string_literal: true

class Batch < ActiveJob::Base
  def run(*args)
    execute(*args)
    str = "#{self.class}#{args}  成功"
    channel = '#batch'
    Services::SlackNotification.post(str, channel)
  rescue => e
    #Raven.capture_exception(e)
  end

  def execute(*_args)
    raise 'Called abstract method: execute'
  end
end
