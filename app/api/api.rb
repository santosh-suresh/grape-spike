

module API
    class BSAPI < Grape::API
        prefix '/api'
        version 'v1', :using => :path
        format :json

        mount Events::API
        # mount Events::Cconfig
        add_swagger_documentation(
            base_path: "/",
            api_version: 'v1',
            hide_documentation_path: true
        )
    end
end