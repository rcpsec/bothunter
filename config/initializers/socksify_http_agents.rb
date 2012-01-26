# Mechanize: call @agent.set_socks(addr, port) before using
require "socksify"
require 'socksify/http'

class Mechanize::HTTP::Agent
public
  def set_socks addr, port
    set_http unless @http
    class << @http
      def http_class
        Net::HTTP.SOCKSProxy(addr, port)
      end
    end
  end
end

# use w/ OAuth2 like OAuth2::Client.new(id, secret, connection_opts: { proxy: 'socks://127.0.0.1:9050' })
class Faraday::Adapter::NetHttp
  def net_http_class(env)
    if proxy = env[:request][:proxy]
      if proxy[:uri].scheme == 'socks'
        Net::HTTP::SOCKSProxy(proxy[:uri].host, proxy[:uri].port)
      else
        Net::HTTP::Proxy(proxy[:uri].host, proxy[:uri].port, proxy[:user], proxy[:password])
      end
    else
      Net::HTTP
    end
  end
end
