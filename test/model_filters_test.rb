require 'test_helper'


class ModelFiltersTest < ActiveSupport::TestCase
  fixtures :books, :authors, :countries

  def setup
  end

  def test_default_filter
    assert Book.filter_by_name('Cat').include?(books(:cats_cradle))
    assert !Book.filter_by_name('Cat').include?(books(:ham_on_rye))
  end

  def test_nested_filter
    assert Book.filter_by_author_first_name('Kur').include?(books(:cats_cradle))
    assert Book.filter_by_author_country_name('US').include?(books(:cats_cradle))
  end

  def test_filter_configuration
    conf = Book.filters_configuration
    assert_equal conf.size, 3
    assert_equal conf[:name][:type], :like
  end

end
