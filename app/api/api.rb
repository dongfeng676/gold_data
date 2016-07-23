class API < Grape::API
  version 'v1', using: :path
  format :json
  formatter :json, Grape::Formatter::Jbuilder
  prefix :api

  resource :gold do
    desc "Return a public timeline."
    get "", jbuilder:'gold/all' do
      @golds = Gold.all
    end
  end
end
