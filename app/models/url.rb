class Url < ActiveRecord::Base
  before_create :make_short_url
  before_create :set_click_count
  validate :check_if_blank

  def check_if_blank
    if self.url.empty?
      errors.add(:url, "Url is empty")
    end
  end

  def set_click_count
    self.click_count = 0
  end

  def make_short_url
    alphabet = ('a'..'z').to_a
    short_url = ""

    6.times do
      short_url << alphabet.sample
    end

    self.short_url = short_url
  end
  # Remember to create a migration!
end
