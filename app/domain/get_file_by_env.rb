# frozen_string_literal: true

# Class used to get required file depending on the environment
class GetFileByEnv
  include Interactor::Initializer

  initialize_with :file_key

  def run
    Rails.env == 'development' ? development_file(file_key) : aws_file(file_key)
  end

  private

  def development_file(file_key)
    "#{Rails.root}/db/#{file_key}"
  end

  def aws_file(file_key)
    Aws::Client.new.get_object(file_key)
  end
end
