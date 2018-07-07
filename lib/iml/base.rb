# frozen_string_literal: true

# Base media file class
class IML::Base < OpenStruct
  def imdb
    return nil unless imdb_doc
    fetch_director
    fetch_rating
    fetch_writer
    fetch_summary
    fetch_actors
    self
  end

  private

  def imdb_link
    search = IML::IMDB.new(title)
    result = search.result
    return nil if result.empty?
    self.year = result.first.year
    result.first.try(:href)
  end

  def imdb_doc
    link = imdb_link
    return nil unless imdb_link
    @html ||= open("https://www.imdb.com#{link}").read
    @imdb_doc ||= Nokogiri::HTML(@html)
  end

  def fetch_director
    self.director ||= imdb_doc.css('span[itemprop=director]').css('span[itemprop=name]').map { |e| e.child.to_s }.join(', ')
  end

  def fetch_rating
    self.rating ||= imdb_doc.css('span.rating').first.child.to_s
  end

  def fetch_writer
    self.writer ||= imdb_doc.css('span[itemprop=creator]').css('span[itemprop=name]').map { |e| e.child.to_s }.join(', ')
  end

  def fetch_summary
    self.summary ||= imdb_doc.css('div.summary_text').text.strip
  end

  def fetch_actors
    self.actors ||= imdb_doc.css('span[itemprop=actors]').css('span[itemprop=name]').map { |e| e.child.to_s }.join(', ')
  end
end
