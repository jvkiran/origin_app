class AllowIframeForCustomers
  ALLOWED_CLIENTS = ["127.0.0.1"]

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)

    request = Rack::Request.new(env)
    # binding.break
    if allowed_route?(request) && allowed_referer?(request.referer)
      headers['X-Frame-Options'] = 'ALLOW-FROM ' + request.referer
    else
      headers['X-Frame-Options'] = 'DENY'
    end

    [status, headers, response]
  end

  private

  def allowed_route?(request)
    request.path == '/widget/tracker_page' || request.path == '/widget/tracker'
  end

  def allowed_referer?(referer)
    return false if referer.nil?

    uri = URI.parse(referer)
    ALLOWED_CLIENTS.include?(uri.host)
  end
end