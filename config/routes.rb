Rails.application.routes.draw do
  get '/:shortlink' => 'links#goto'
end
