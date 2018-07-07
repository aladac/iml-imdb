RSpec.describe IML do
  it "has a version number" do
    expect(IML::VERSION).not_to be nil
  end

  context 'Movie' do
    it '#imdb shoud get metadata' do
      movie = IML::Movie.new(title: 'Lethal Weapon')
      VCR.use_cassette("IML::Base#imdb", record: :new_episodes) do
        expect(movie.imdb.director).to be_a(String)
        expect(movie.imdb.summary).to be_a(String)
      end
    end
  end

  context 'IMDB' do
    it '#new should complete without errors' do
      VCR.use_cassette("IML::IMDB.new", record: :new_episodes) do
        search = IML::IMDB.new('lethal weapon')
        expect(search.result.first).to be_an(IML::TVSeries)
      end
    end
  end
end
