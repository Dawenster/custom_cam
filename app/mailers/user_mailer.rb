class UserMailer < ActionMailer::Base
  default :from => "orioleslose@gmail.com"

  def welcome_email(user)
    @user = user
    @url = new_session_path
    mail(:to => user.email, :subject => "Welcome to Custom Cam!!! ")
  end

  def creator_reminder(user, contest_id)
    @creator = user
    @contest = Contest.find(contest_id)
    @contest_url = contest_path(@contest)
    mail(:to => @creator.email, :subject => "Time to pick your photo!")
  end

  def winner_email(winner, contest)
    @user = winner
    @url = contest_path(contest)
    mail(:to => @user.email, :subject => "I'm on a boat!!!")
  end
end
