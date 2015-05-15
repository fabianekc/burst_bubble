class ReposController < ApplicationController
  require 'csv'
  before_action :logged_in
  before_action :logged_in, only: [:index, :destroy]

  require 'will_paginate/array'
  def index
    @available = Repository.all.pluck(:vat)
    @unknowns = Response.where.not(vat: Repository.pluck(:vat)).pluck(:vat).uniq
    @repos = (@available + @unknowns).paginate(page: params[:page], per_page: 15)
  end

  def show
    @repo = Repository.find_by_vat(params[:id])
    @responses = Response.where(vat: params[:id])
    if @repo.nil?
      server = @responses.first.list.to_s
      if server == "" then
        server = "https://www.crwdst.at"
      end
      lookup = HTTParty.get(server + "/" + params[:id] + "/quest_json")
      if lookup.success?
        @repo = Repository.create(name: lookup[0]['name'],
                                  vat:  params[:id])
      end
    end

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def destroy
    Response.where(vat: params[:id]).destroy_all
    redirect_to repos_path
  end
end
