require 'yaml'

class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "/apidocs/#{path}"
  end
end

Swagger::Docs::Config.register_apis({
  "1.0" => {
    # the output location where your .json files are written to
    :api_file_path => "public/apidocs/",
    # the URL base path to your API
    :base_path => Rails.application.secrets.host_name,
    # if you want to delete all .json files at each generation
    :clean_directory => true,
    # add custom attributes to api-docs
  }
})