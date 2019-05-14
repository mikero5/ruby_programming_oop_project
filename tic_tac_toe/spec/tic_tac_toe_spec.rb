require_relative '../tic_tac_toe.rb'

RSpec.describe "TicTacToe" do
  subject do
    TicTacToe.new
  end

  describe "check Player.validate?" do
    it "Player.validate? called" do
      player = Player.new('X')
      player.move = '2'
      expect(player.validate?(['X', '2', '3', 'X', '5', '6', 'X', '8', '9'])).to eql(true)
    end
  end

  describe "TicTacToe.next_turn" do
    it "next_turn" do
      expect(subject.current_player.symbol).to eql('X')
      subject.next_turn
      expect(subject.current_player.symbol).to eql('O')
    end
  end
  
  describe "check X win" do
    it "check X win left column" do
      subject.state_array = ['X', '2', '3', 'X', '5', '6', 'X', '8', '9']
      expect((subject.winner).symbol).to eql('X')
    end

    it "check X win middle column" do
      subject.state_array = ['1', 'X', '3', '4', 'X', '6', '7', 'X', '9']
      expect((subject.winner).symbol).to eql('X')
    end
      
    it "check X win right column" do
      subject.state_array = ['1', '2', 'X', '4', '5', 'X', '7', '8', 'X']
      expect((subject.winner).symbol).to eql('X')
    end
      
    it "check X win top row" do
      subject.state_array = ['X', 'X', 'X', '4', '5', '6', '7', '8', '9']
      expect((subject.winner).symbol).to eql('X')
    end
      
    it "check X win middle row" do
      subject.state_array = ['1', '2', '3', 'X', 'X', 'X', '7', '8', '9']
      expect((subject.winner).symbol).to eql('X')
    end
      
    it "check X win bottom row" do
      subject.state_array = ['1', '2', '3', '4', '5', '6', 'X', 'X', 'X']
      expect((subject.winner).symbol).to eql('X')
    end
      
    it "check X win top left diagonal" do
      subject.state_array = ['X', '2', '3', '4', 'X', '6', '7', '8', 'X']
      expect((subject.winner).symbol).to eql('X')
    end
      
    it "check X win top right diagonal" do
      subject.state_array = ['1', '2', 'X', '4', 'X', '6', 'X', '8', '9']
      expect((subject.winner).symbol).to eql('X')
    end
  end
  
  describe "check O win" do
    it "check O win left column" do
      subject.state_array = ['O', '2', '3', 'O', '5', '6', 'O', '8', '9']
      expect((subject.winner).symbol).to eql('O')
    end

    it "check O win middle column" do
      subject.state_array = ['1', 'O', '3', '4', 'O', '6', '7', 'O', '9']
      expect((subject.winner).symbol).to eql('O')
    end
      
    it "check O win right column" do
      subject.state_array = ['1', '2', 'O', '4', '5', 'O', '7', '8', 'O']
      expect((subject.winner).symbol).to eql('O')
    end
      
    it "check O win top row" do
      subject.state_array = ['O', 'O', 'O', '4', '5', '6', '7', '8', '9']
      expect((subject.winner).symbol).to eql('O')
    end
      
    it "check O win middle row" do
      subject.state_array = ['1', '2', '3', 'O', 'O', 'O', '7', '8', '9']
      expect((subject.winner).symbol).to eql('O')
    end
      
    it "check O win bottom row" do
      subject.state_array = ['1', '2', '3', '4', '5', '6', 'O', 'O', 'O']
      expect((subject.winner).symbol).to eql('O')
    end
      
    it "check O win top left diagonal" do
      subject.state_array = ['O', '2', '3', '4', 'O', '6', '7', '8', 'O']
      expect((subject.winner).symbol).to eql('O')
    end
      
    it "check O win top right diagonal" do
      subject.state_array = ['1', '2', 'O', '4', 'O', '6', 'O', '8', '9']
      expect((subject.winner).symbol).to eql('O')
    end
  end

  describe "tie game" do
    it "tie game" do
      subject.state_array = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O']
      expect((subject.winner)).to eql('tie')
    end
  end

  describe "mid game" do
    it "mid game" do
      subject.state_array = ['X', 'O', '3', 'O', 'X', 'X', 'O', 'X', 'O']
      expect((subject.winner)).to eql(false)
    end
  end

end
