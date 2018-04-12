class FeatureGenerator < Rails::Generators::NamedBase
  require 'rails/generators/base'
  class_option :scaffold
  class_option :language, type: :string, default: 'en'
  class_option :folder, type: :string

  desc "This generator creates a .feature file in /features and the _steps.rb file in /features/step_definitions for a feature in cucumber based on the name of the feature"
  gem 'cucumber-rails', group: "test"
  def create_feature_file
    if options['language'] == 'pt'
      if options['scaffold']
        template = "Funcionalidade: #{file_name}
  Como [stakeholder]
  Para que eu [funcionalidade]
  Eu quero [finalidade]\n
  #index
  Cenário: Listar todos os #{file_name.pluralize}\n
  #create
  Cenário: Criar um #{file_name}\n
  #show
  Cenário: Mostrar um #{file_name}\n
  #edit
  Cenário: Editar um #{file_name}\n
  #destroy
  Cenário: Deletar um #{file_name}\n"
      else
        template = "Funcionalidade: #{file_name}
  Como [stakeholder]
  Para que eu [funcionalidade]
  Eu quero [finalidade]\n"
      end
    else
      if options['scaffold']
        template = "Feature: #{file_name}
  As a [stakeholder]
  So that I [functionality]
  I want to [goal]\n
  #index
  Scenario: List all #{file_name.pluralize}\n
  #create
  Scenario: Create a #{file_name}\n
  #show
  Scenario: Show a #{file_name}\n
  #edit
  Scenario: Edit a #{file_name}\n
  #destroy
  Scenario: Delete a #{file_name}\n"
      else
        template = "Feature: #{file_name}
  As a [stakeholder]
  So that I [functionality]
  I want to [goal]\n"
      end
    end
    if options['folder']
      create_file "features/#{options['folder']}/#{file_name}.feature", "#language: #{options['language']}\n#encoding: utf-8\n\n#{template}"
    else
      create_file "features/#{file_name}.feature", "#language: #{options['language']}\n#encoding: utf-8\n\n@#{file_name}\n#{template}"
    end
  end

  def create_feature_steps_file
    if options['folder']
      if options['scaffold']
        create_file "features/step_definitions/#{options['folder']}/#{file_name}_steps.rb","# This is the steps file referred to #{file_name} feature\n# Place your code relative to that feature here\n
#index steps\n
#create steps\n
#show steps\n
#edit steps\n
#destroy steps\n"
      else
        create_file "features/step_definitions/#{options['folder']}/#{file_name}_steps.rb","# This is the steps file referred to #{file_name} feature\n# Place your code relative to that feature here"
      end
    else
      if options['scaffold']
        create_file "features/step_definitions/#{file_name}_steps.rb","# This is the steps file referred to #{file_name} feature\n# Place your code relative to that feature here\n
#index steps\n
#create steps\n
#show steps\n
#edit steps\n
#destroy steps\n"
      else
        create_file "features/step_definitions/#{file_name}_steps.rb","# This is the steps file referred to #{file_name} feature\n# Place your code relative to that feature here"
      end
    end
  end
end