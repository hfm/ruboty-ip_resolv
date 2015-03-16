require 'resolv'

module Ruboty
  module IpResolv
    module Actions
      class IpResolv < Ruboty::Actions::Base
        attr_reader :message, :ipaddr

        def initialize(message)
          @message = message
          @ipaddr = message[:ipaddr]
        end

        def call
          message.reply(resolv)
        end

        def resolv
          hostname = Resolv.getname(ipaddr)
          "#{ipaddr} is pointed to #{hostname}"
        rescue Resolv::ResolvError => e
          "#{e}"
        end
      end
    end
  end
end
