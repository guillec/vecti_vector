require "vecti/version"
require "cmath"
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

    def magnitude
      square_root_array =[]

      self.coordinates.each do |coordinate|
        square_root_array.push(coordinate ** 2)
      end

      (CMath.sqrt(square_root_array.inject(:+))).round(3)
    end

    def normalize
      magnitude = self.magnitude
      result    = (1 / magnitude)
      self.scalar_multiplication(result)
    end
  end
end
