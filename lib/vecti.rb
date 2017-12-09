require "vecti/version"
require "pry"

module Vecti
  class Vector
    attr_reader :coordinates
    attr_reader :dimension

    def initialize(coordinates:)
      @coordinates = coordinates
      @dimension   = coordinates.length
    end

    def to_s
      "Vector (#{coordinates.join(", ")})"
    end

    def eq(v)
      self.coordinates == v.coordinates
    end

    def sum(v)
      result =[]
      self.coordinates.each_with_index do |vector_coor, index|
        result.push((vector_coor + v.coordinates[index]).round(3))
      end

      Vecti::Vector.new(coordinates: result)
    end

    def sub(v)
      result =[]
      self.coordinates.each_with_index do |vector_coor, index|
        result.push((vector_coor - v.coordinates[index]).round(3))
      end

      Vecti::Vector.new(coordinates: result)
    end

    def scalar_multiplication(scalar)
      result =[]
      self.coordinates.each_with_index do |vector_coor, index|
        result.push((scalar * vector_coor).round(3))
      end

      Vecti::Vector.new(coordinates: result)
    end
  end
end
