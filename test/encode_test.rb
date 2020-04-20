require_relative 'test_helper'

class EncodeTest < Minitest::Test

  def setup
    @encode = Encode.new("HELLO WORLD", "02715", "040895")
    @decode = Encode.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encode, @encode
    assert_instance_of Encode, @decode
  end

  def test_it_has_attributes
    assert_equal "HELLO WORLD", @encode.message
    assert_equal "02715", @encode.key
    assert_equal "040895", @encode.date

    assert_equal "keder ohulw", @decode.message
    assert_equal "02715", @decode.key
    assert_equal "040895", @decode.date
  end

  def test_character_set
    result = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal result, @encode.character_set
  end

  def test_keys
    result = { A: 2, B: 27, C: 71, D: 15}
    assert_equal result, @encode.keys
    assert_equal result, @decode.keys
  end

  def test_offsets
    result = {A: 1, B: 0, C: 2, D: 5}
    assert_equal result, @encode.offsets
    assert_equal result, @decode.offsets
  end

  def test_shifts
    result = {A: 3, B: 0, C: 19, D: 20}
    assert_equal result, @encode.shifts
    assert_equal result, @decode.shifts
  end

  def test_encrypt_message
    result = "keder ohulw"
    assert_equal result, @encode.encrypt_message
    encode2 = Encode.new("HI!", "02715", "040895")
    result2 = "ki!"
    assert_equal result2, encode2.encrypt_message
  end
end
