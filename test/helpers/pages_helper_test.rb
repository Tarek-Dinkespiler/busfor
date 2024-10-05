require "test_helper"

class PagesHelperTest < ActionView::TestCase
  test "when the locale is :en, the language_tag should be Eng" do
    locale = :en
    assert_equal("Eng", language_tag(locale))
  end

  test "when the locale is :fr, the language_tag should be Fra" do
    locale = :fr
    assert_equal("Fra", language_tag(locale))
  end

  test "when the locale is :ru, the language_tag should be Рус" do
    locale = :ru
    assert_equal("Рус", language_tag(locale))
  end

  test "when the locale is :uk, the language_tag should be Укр" do
    locale = :uk
    assert_equal("Укр", language_tag(locale))
  end

  test "when the locale is :rururu, the language_tag should be Eng" do
    locale = :rururu
    assert_equal("Eng", language_tag(locale))
  end

  test "when the locale is 'fr', the language_tag should be Fra" do
    locale = "fr"
    assert_equal("Fra", language_tag(locale))
  end

  test "when the locale is 'français', the language_tag should be Eng" do
    locale = "français"
    assert_equal("Eng", language_tag(locale))
  end

  test "when the locale is 123, the language_tag should be Eng" do
    locale = 123
    assert_equal("Eng", language_tag(locale))
  end
end
