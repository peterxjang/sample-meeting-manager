class MeetingsController < ApplicationController
  def index
    if params[:tag]
      @meetings = Tag.find_by(name: params[:tag]).meetings
    else
      @meetings = Meeting.all
    end
    render 'index.html.erb'
  end

  def new
    @meeting = Meeting.new
    @tags = Tag.all
    render 'new.html.erb'
  end

  def create
    @tags = Tag.all
    @meeting = Meeting.new(
      name: params[:name],
      address: params[:address],
      start_time: params[:start_time],
      end_time: params[:end_time],
      notes: params[:notes]
    )
    if @meeting.save
      params[:tags].each do |tag_id|
        MeetingTag.create(
          meeting_id: @meeting.id,
          tag_id: tag_id
        )
      end
      flash[:success] = "Meeting successfully created!"
      redirect_to '/meetings'
    else
      render 'new.html.erb'
    end
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @meeting = Meeting.find_by(id: params[:id])
    @tags = Tag.all
    render 'edit.html.erb'
  end

  def update
    @tags = Tag.all
    @meeting = Meeting.find_by(id: params[:id])
    if @meeting.update(
      name: params[:name],
      address: params[:address],
      start_time: params[:start_time],
      end_time: params[:end_time],
      notes: params[:notes]
    )
      @meeting.tags.destroy_all
      params[:tags].each do |tag_id|
        MeetingTag.create(
          meeting_id: @meeting.id,
          tag_id: tag_id
        )
      end
      flash[:success] = "Meeting successfully updated!"
      redirect_to "/meetings/#{@meeting.id}"
    else
      render 'edit.html.erb'
    end
  end
end
