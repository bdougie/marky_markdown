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

  def test_identify_variables
    str = "<!--#\r\nEXAMPLE=mother\r\n$-->"
    variables = MarkyMarkdown::Transformer.identify_variables(str)
    assert variables.key?("EXAMPLE")
    refute variables.key?(nil)
    assert_instance_of Hash, variables, "Variable hash was not created"
  end

  def test_compile
    variables = MarkyMarkdown::Transformer.identify_variables(@test_case)
    transformation = MarkyMarkdown::Transformer.compile({variables: variables, body: @test_case})
    assert transformation.include?("Say hi to your mother")
    assert_instance_of String, transformation, "Transformed string was not created"
  end

  def test_shorten_str
    str = MarkyMarkdown::Helpers.shorten_str(@test_case)
    assert str < @test_case, "the shorten_str method failed to shortened the string"
  end

  def test_split_str_by_returns
    str = MarkyMarkdown::Helpers.shorten_str(@test_case)
    variable_array = MarkyMarkdown::Helpers.split_str_by_returns(str)
    assert_instance_of Array, variable_array, "Array without returns was not created"
  end
end
