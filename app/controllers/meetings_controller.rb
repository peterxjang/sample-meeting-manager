class MeetingsController < ApplicationController
  def index
    if params[:tag]
      @meetings = Tag.find_by(name: params[:tag]).meetings
    else
      @meetings = Meeting.all
    end
    render 'index.html.erb'
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
