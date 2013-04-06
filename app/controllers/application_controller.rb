class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  helper_method :current_user

  def humanize(secs)
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].inject([]){ |s, (count, name)|
      if secs > 0
        secs, n = secs.divmod(count)
        s.unshift "#{n.to_i} #{name}"
      end
      s
    }.join(' ')
  end

  helper_method :humanize
end
