module Ruboty
  module Handlers
    class IpResolv < Base
      on(
        /(?<ipaddr>\d+\.\d+\.\d+\.\d+)/,
        all: true,
        name: 'resolv',
        description: 'Resolv IP address to hostname'
      )

      def resolv(message)
        Ruboty::IpResolv::Actions::IpResolv.new(message).call
      end
    end
  end
end
