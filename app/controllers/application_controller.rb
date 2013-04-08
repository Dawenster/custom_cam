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

  def countdown_num(num)
    if num.length > 5
      num.insert(0,"00:")
    elsif num.length > 2
      num.insert(0,"00:00:")
    else
      num.insert(0,"00:00:00:")
    end

    matches = num.match ( /(\d{0,2}):(\d{0,2}):(\d{0,2}):(\d{0,2})/ ) 
    correct_num = ""
    i = 1
    first = true
    
    ((matches.length) -1 ).times do
      if matches[i].length == 1 && first == false 
        correct_num << (":0" + matches[i] )
        i += 1
      elsif matches[i].length == 1 && first == true
        correct_num << ("0" + matches[i])
        first = false
        i += 1
      elsif matches[i].length == 2 && first == true
        correct_num << matches[i]
        first = false
        i += 1
      else
        correct_num << (":" + matches[i] )
        i += 1
      end
    end
    correct_num
  end

  helper_method :humanize, :countdown_num
end
