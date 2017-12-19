class Rails::ComponentGenerator < Rails::Generators::NamedBase
  def create_view_file
    %w{index new show edit }.each do |action|
      create_file "app/frontend/#{file_name}/#{action}.html.erb"
    end
  end

  def create_js_file
    create_file "app/frontend/#{file_name}/#{file_name}.js",
                "import './#{file_name}.css';\n"
    inject_into_file 'app/frontend/packs/application.js',
                     "import '#{file_name}/#{file_name}'\n",
                     before: "\n// End Imports\n"
  end

  def create_css_file
    # linting disabled by default
    create_file "app/frontend/#{file_name}/#{file_name}.css",
                "/* stylelint-disable */\n"
  end

  protected

  def file_name
    super.pluralize
  end
end
