require_relative 'test_helper'

class EncodeTest < Minitest::Test

  def setup
    @encode = Encode.new("HELLO WORLD", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encode, @encode
  end

  def test_it_has_attributes
    assert_equal "hello world", @encode.message
    assert_equal "02715", @encode.key
    assert_equal "040895", @encode.date
  end

  def test_character_set
    result = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal result, @encode.character_set
  end
end
