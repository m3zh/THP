require_relative '../lib/cher_depute'


describe "the get_url method" do
  it "should return an array of urls" do
    page = 'http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'
    expect(get_url(page)).to include(["http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719960", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721702"])
  end
end

describe "the get_email method" do
  it "should return an hash of towns and their emails" do
    urls = ["http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605694", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA1276", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA334149", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721896", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA609332", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719960", "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721702"]
    expect(get_email(urls)).to be_an(Hash)
  end
end
