require_relative '../lib/dark_trader'


describe "the dark_trader method" do
  it "should return a crypto-company and its value" do
    expect(dark_trader).to include({"Bitcoin"=>"7,013.81", "Ethereum"=>"170.81", "Matic Network"=>"0.012405", "aelf"=>"0.062627", "Ardor"=>"0.033908"})
    expect(dark_trader).to be_an(Hash)
  end
end
