class RepositoriesController < ApplicationController
  def index
    binding.pry
    github = GithubService.new
    @repos_array = github.get_repos
    redirect_to '/'
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
