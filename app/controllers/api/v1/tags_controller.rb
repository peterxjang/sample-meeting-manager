class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render 'index.json.jbuilder'
  end
end
