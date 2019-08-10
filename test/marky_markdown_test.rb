require "test_helper"

class MarkyMarkdownTest < Minitest::Test
  def setup
    @test_case = "<!--#\r\nEXAMPLE=mother\r\n$-->\r\nSay hi to your {{ EXAMPLE }} for me"
    @successful_transform = "<!--#\r\nEXAMPLE=mother\r\n$-->\r\nSay hi to your mother for me"
  end

  def test_that_it_has_a_version_number
    refute_nil ::MarkyMarkdown::VERSION
  end

  def test_that_the_test_case_works
    transformation = MarkyMarkdown::Transformer.transform(@test_case)
    assert_equal @successful_transform, transformation, "Transformation for the test case was unsuccessful"
  end

  def shorten_str_test
    str = MarkyMarkdown::Helpers.shorten_str(@test_case)
    assert str < @test_case, "the shorten_str method failed to shortened the string"
    assert_not_equal str < @test_case, "the string is not less than the original"
  end

  def split_str_by_returns_test
    str = MarkyMarkdown::Helpers.shorten_str(@test_case)
    variable_hash = MarkyMarkdown::Helpers.split_str_by_returns_test(str)
    assert_equal variable_hash, {EXAMPLE: "mother"}, "Variable hash was unable to be created"
  end
end
