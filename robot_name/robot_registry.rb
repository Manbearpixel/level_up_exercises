require_relative "errors"

class RobotRegistry
  attr_accessor :robots

  ERROR_INVALID_NAME  = "Invalid robot name."
  ERROR_ROBOT_EXISTS  = "Robot name already registered."

  VALID_ROBOT_NAME_REGEX = /[[:alpha:]]{2}[[:digit:]]{3}/

  def initialize
    @robots = []
  end

  def add_robot_to_registry(name)
    raise InvalidNameError, ERROR_INVALID_NAME unless proper_name?(name)
    raise NameExistsError, ERROR_ROBOT_EXISTS << " [#{name}]" if robot_registered?(name)
    robots << name
  end

  private 

  def proper_name?(name)
    name =~ VALID_ROBOT_NAME_REGEX
  end

  def robot_registered?(name)
    robots.include?(name)
  end
end