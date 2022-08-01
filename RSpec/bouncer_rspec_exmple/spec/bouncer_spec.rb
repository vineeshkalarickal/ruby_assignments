require 'bouncer'
describe "Bouncer" do
  it 'Rejects xx from enternig the venue' do 
    b= Bouncer.new
    bounced = b.bounce('xx')
    expect(bounced).to be_truthy
  end
end
