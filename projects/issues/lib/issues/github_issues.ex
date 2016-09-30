defmodule Issues.GithubIssues do

  require Logger

  @user_agent [ {"User-agent", "Elixir hello@kalina.tech"} ]

  def fetch(user, project) do
    Logger.info "Fetching user #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get!(@user_agent)
    |> handle_response
  end

  # use a module attribute to fetch the value at compile time
  @github_url Application.get_env(:issues, :github_url)

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response(%{status_code: 200, body: body}) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    { :ok, :jsx.decode(body) }
  end

  def handle_response(%{status_code: status, body: body}) do
    Logger.error "Error #{status} returned"
    { :error, :jsx.decode(body) }
  end
end
