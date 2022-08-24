require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
      return @columns ||= DBConnection.execute2(<<-SQL).first.map(&:to_sym)
      SELECT
        *
      FROM
        '#{self.table_name}'
      LIMIT 0
      SQL

  end


  def self.finalize!
    self.columns.each do |col|
      define_method(col) {self.attributes}
      #define_method("#{col}=") {|val| self.name = val}
      
    end
  end

  def self.table_name=(table_name)
    @table_name =  table_name.tableize
  end

  def self.table_name
    @table_name ||= self.name.tableize

  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
