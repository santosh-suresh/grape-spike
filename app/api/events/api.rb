require 'grape-swagger'

module Events

    class API < Grape::API

        before do
          header['Access-Control-Allow-Origin'] = '*'
          header['Access-Control-Request-Method'] = '*'
        end


        resource :config do
            desc "Returns all the api configurations"
            get do
                ApiConf.all
            end

            desc "Set a parameter value for a given key"
            params do
                requires :key, type:String, desc: "Config key"
                requires :value, type:String, desc: "The new value if the key does not exist or the updated value"
            end
            post do
                ApiConf[params[:key.to_s]] = params[:value.to_s]
            end

            desc "Return a configuration for a given key"
            params do
                requires :key, type:String, desc: "Config Key"
            end
            route_param :key do
                get do
                    value = ApiConf.find_by_name(params[:key].to_s) || {}
                    value

                end
            end
        end

        resource :companies do
            desc "Returns a list of all the companies"
            get do
                Company.all
            end

            desc "Create a company"
            params do
                requires :name, type: String, desc: "Company Name"
                requires :system_name, type: String, desc: "System Name"
                requires :domain, type:String, desc:"COmpany Domain"
            end
            post do
                Company.create!({
                    name: params[:name],
                    system_name: params[:system_name],
                    domain: params[:domain],
                    uuid: Digest::SHA1.hexdigest([Time.now, rand].join)
                    })
            end
        end
    end
end