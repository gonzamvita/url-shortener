Rails.application.routes.draw do
  get "/" => "links#home"

  post("/shortener" => "links#shortener")

  get '/:shortlink' => 'links#goto'
end
