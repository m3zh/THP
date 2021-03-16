require_relative '../lib/mairie_xmas'

describe "the get_url method" do
  it "should return an array of urls" do
    page = "https://www.annuaire-des-mairies.com/val-d-oise.html"
    expect(get_url(page)).to include(["https://www.annuaire-des-mairies.com/95/ableiges.html", "https://www.annuaire-des-mairies.com/95/villiers-le-bel.html", "https://www.annuaire-des-mairies.com/95/villiers-le-sec.html", "https://www.annuaire-des-mairies.com/95/wy-dit-joli-village.html"])
  end
end

describe "the get_email method" do
  it "should return an hash of towns and their emails" do
    array = ["https://www.annuaire-des-mairies.com/95/ableiges.html", "https://www.annuaire-des-mairies.com/95/villiers-adam.html", "https://www.annuaire-des-mairies.com/95/villiers-le-bel.html", "https://www.annuaire-des-mairies.com/95/villiers-le-sec.html", "https://www.annuaire-des-mairies.com/95/wy-dit-joli-village.html"]
    expect(get_email(array)).to be_an(Hash)
  end
end
