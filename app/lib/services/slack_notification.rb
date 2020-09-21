# frozen_string_literal: true

require 'slack/incoming/webhooks'

module Services
  class SlackNotification
    class << self
      def post(text, channel = '#general')
        if ENV['SLACK_INCOMING_WEBHOOK_URL'].present?
          slack = Slack::Incoming::Webhooks.new ENV['SLACK_INCOMING_WEBHOOK_URL'], channel: channel
          slack.post(text)
        end
      end
    end
  end
end
