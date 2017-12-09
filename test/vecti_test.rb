require 'test_helper'

class VectiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Vecti::VERSION
  end

  def test_it_initializes
    my_vector = Vecti::Vector.new(coordinates: [1,2,3])
    assert my_vector
  end

  def test_it_has_coordinates
    my_vector = Vecti::Vector.new(coordinates: [1,2,3])
    refute my_vector.coordinates.empty?
  end

  def test_eq
    my_vector_1 = Vecti::Vector.new(coordinates: [1,2,3])
    my_vector_2 = Vecti::Vector.new(coordinates: [1,2,3])

    assert my_vector_1.eq(my_vector_2)

    my_vector_3 = Vecti::Vector.new(coordinates: [-1,2,3])
    refute my_vector_1.eq(my_vector_3)
  end

  def test_sum
    my_vector_1 = Vecti::Vector.new(coordinates: [8.218, -9.341])
    my_vector_2 = Vecti::Vector.new(coordinates: [-1.129, 2.111])

    expected_vector = Vecti::Vector.new(coordinates: [7.089, -7.230])
    assert my_vector_1.sum(my_vector_2).eq(expected_vector)
  end

  def test_sub
    my_vector_1 = Vecti::Vector.new(coordinates: [7.119, 8.215])
    my_vector_2 = Vecti::Vector.new(coordinates: [-8.223, 0.878])

    expected_vector = Vecti::Vector.new(coordinates: [15.342,7.337])
    assert my_vector_1.sub(my_vector_2).eq(expected_vector)
  end

  def test_scalar_multiplication
    my_vector_1 = Vecti::Vector.new(coordinates: [1.671,-1.012,-0.318])

    expected_vector = Vecti::Vector.new(
      coordinates: [12.382, -7.499, -2.356])
    assert my_vector_1.scalar_multiplication(7.41).eq(expected_vector)
  end
end
