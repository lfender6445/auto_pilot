require 'logger'
system 'mkdir', '-p', 'log'

module AutoPilot
  class Log < Logger
    class << self
      attr_accessor :message

      def out(text)
        $stdout.write text
      end

      def colorize(text, color_code)
        $stdout.write "\e[#{color_code}m#{text}\e[0m\n"
      end

      def red(text)
        @message = text
        colorize(text, 31)
        logger.error text
      end

      def yellow(text)
        @message = text
        colorize(text, 33)
      end

      def green(text)
        @message = text
        colorize(text, 32)
        logger.info text
      end

      private

      def logger
        @logger ||= new 'log/auto_pilot.log'
      end
    end
  end
end
