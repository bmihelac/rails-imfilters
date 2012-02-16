require 'test_helper'


class ModelFiltersTest < ActiveSupport::TestCase
  fixtures :books, :authors, :countries

  def setup
  end

  def test_like_filter
    assert Book.filter_by_name('Cat').include?(books(:cats_cradle))
    assert !Book.filter_by_name('Cat').include?(books(:ham_on_rye))
  end

  def test_nested_like_filter
    assert Book.filter_by_author_first_name('Kur').include?(books(:cats_cradle))
    assert Book.filter_by_author_country_name('US').include?(books(:cats_cradle))
  end

  def test_from_date_filter
    assert Book.filter_by_published_on_from_date('1963-08-13').include?(books(:cats_cradle))
  end

  def test_to_date_filter
    assert Book.filter_by_published_on_to_date('1963-08-13').include?(books(:cats_cradle))
  end

  def test_filter_configuration
    conf = Book.filters_configuration
    assert_equal conf.size, 4
    assert_equal conf[:name][:type], :like
  end

end
