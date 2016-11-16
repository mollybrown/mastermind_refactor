require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/code_generator.rb'

class TestCodeGenerator < Minitest::Test

  def test_secret_code_is_returned_as_array
    code_generator = CodeGenerator
    secret_code = code_generator.generate_secret_code
    assert_equal Array, secret_code.class
  end

  def test_it_can_generate_a_four_letter_sequence
    code_generator = CodeGenerator
    secret_code = code_generator.generate_secret_code
    assert_equal 4, secret_code.length
  end

  def test_it_can_generate_a_random_four_letter_sequence
    code_generator = CodeGenerator
    secret_code = code_generator.generate_secret_code
    assert_equal 4, secret_code.length
    refute_equal "rgby", secret_code
  end

end
