class FeatureGenerator < Rails::Generators::NamedBase
  require 'rails/generators/base'

  class_option :language, type: :string, default: 'en'
  class_option :folder, type: :string

  desc "This generator creates a .feature file in /features and the _steps.rb file in /features/step_definitions for a feature in cucumber based on the name of the feature"
  gem 'cucumber-rails', group: "test"
  def create_feature_file
    if options['language'] == 'pt'
      template = "Funcionalidade: #{file_name}
      Como [stakeholder]
      Para que eu [funcionalidade]
      Eu quero [finalidade]\n"
    else
      template = "Feature: #{file_name}
      As a [stakeholder]
      So that I [functionality]
      I want to [goal]\n"
    end
    if options['folder']
      create_file "features/#{options['folder']}/#{file_name}.feature", "#language: #{options['language']}\n#encoding: utf-8\n\n#{template}"
    else
      create_file "features/#{file_name}.feature", "#language: #{options['language']}\n#encoding: utf-8\n\n@#{file_name}\n#{template}"
    end
  end

  def create_feature_steps_file
    if options['folder']
      create_file "features/step_definitions/#{options['folder']}/#{file_name}_steps.rb","# This is the steps file referred to #{file_name} feature\n# Place your code relative to that feature here"
    else
      create_file "features/step_definitions/#{file_name}_steps.rb","# This is the steps file referred to #{file_name} feature\n# Place your code relative to that feature here"
    end
  end
end