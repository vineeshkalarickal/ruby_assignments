require './match_details'

describe MatchDetails do

  describe '.total_balls' do
  context 'Set match type as Test' do
    it 'returns 60' do
      match_details = MatchDetails.new(1) 
      expect(match_details.total_balls).to eq(60)
      end
    end

  context 'Set match type as ODI' do
    it 'returns 40' do
      match_details = MatchDetails.new(2) 
      expect(match_details.total_balls).to eq(48)
      end
    end

  context 'Set match type as T20' do
    it 'returns 30' do
      match_details = MatchDetails.new(3) 
      expect(match_details.total_balls).to eq(30)
      end
    end
  end  
end
