class Character < ApplicationRecord
  belongs_to :player
  has_many :languages
  validates :name, uniqueness: 
  attr_reader :str_mod, :con_mod, :dex_mod, :int_mod, :wis_mod, :cha_mod, :ini_mod, :size, :speed, :vision, :languages

  def ability_modifiers
  	@str_mod = 0
  	@con_mod = 0
  	@dex_mod = 0
  	@int_mod = 0
  	@wis_mod = 0
  	@cha_mod = 0
  	@ini_mod = 0
  	mods = [@str_mod, @con_mod, @dex_mod, @int_mod, @wis_mod, @cha_mod]
  	abils = [self.str, self.con, self.dex, self.int, self.wis, self.cha]
  	races = ["Dragonborn", "Dwarf", "Eladrin", "Elf", "Half-Elf", "Halfling", "Human", "Tiefling"]
  	i = 0
  	mods.each do |mod|
  		if abils[i] == 1
  			mods[i] = -5
  			i+=1
  		else
  			abil_check = [2,3]
  			mods[i] = -4
  			until abil_check.include? abils[i]
  				abil_check.collect! {|abil| abil+=2}
  				mods[i]+=1
  			end
  			i+=1
  		end
  	end
  	race = self.race
  	case race
  	when "Dragonborn"
  		mods[0] += 2
  		mods[5] += 2
  	when "Dwarf"
  		mods[1] += 2
  		mods[4] += 2
  	when "Eladrin"
  		mods[2] += 2
  		mods[3] += 2
  	when "Elf"
  		mods[2] += 2
  		mods[4] += 2
  	when "Half-Elf"
  		mods[1] += 2
  		mods[5] += 2
  	when "Halfling"
  		mods[2] += 2
  		mods[5] += 2
  	when "Tiefling"
  		mods[3] += 2
  		mods[5] += 2
  	else
  		return
  	end
  	@str_mod = mods[0]
  	@con_mod = mods[1]
  	@dex_mod = mods[2]
  	@int_mod = mods[3]
  	@wis_mod = mods[4]
  	@cha_mod = mods[5]
  	@ini_mod = mods[2] + (self.level*0.5).floor
  	mods
  end

  def calc_level 
  	experience = self.experience
  	case experience
  	when 0...1000
  		self.level = 1
  	when 1000...2250
  		self.level = 2
  	when 2250...3750
  		self.level = 3
  	when 3750...5500
  		self.level = 4
  	when 5500...7500
  		self.level = 5
  	when 7500...10000
  		self.level = 6
  	when 10000...13000
  		self.level = 7
  	when 13000...16500
  		self.level = 8
  	when 16500...20500
  		self.level = 9
  	when 20500...26000
  		self.level = 10
  	when 26000...32000
  		self.level = 11
  	when 32000...39000
  		self.level = 12
  	when 39000...47000
  		self.level = 13
  	when 47000...57000
  		self.level = 14
  	when 57000...69000
  		self.level = 15
  	when 69000...83000
  		self.level = 16
  	when 83000...99000
  		self.level = 17
  	when 99000...119000
  		self.level = 18
  	when 119000...143000
  		self.level = 19
  	when 143000...175000
  		self.level = 20
  	when 175000...210000
  		self.level = 21
  	when 210000...255000
  		self.level = 22
  	when 255000...310000
  		self.level = 23
  	when 310000...375000
  		self.level = 24
  	when 375000...450000
  		self.level = 25
  	when 450000...550000
  		self.level = 26
  	when 550000...675000
  		self.level = 27
  	when 675000...825000
  		self.level = 28
  	when 825000...1_000_000
  		self.level = 29
  	else
  		self.level = 30
  	end
  	self.level
  end

  def defenses
  	@fort = [@str_mod, @con_mod].max + (self.level*0.5).floor + 10
  	char_class = self.char_class
  end

  def calc_racial
  	race = self.race
  	case race
  	when "Dragonborn"
  		@size = "Medium"
  		@speed = 6
  		@vision = "Normal"
  		@languages = ["Common", "Draconic"]
  	when "Dwarf"
  		@size = "Medium"
  		@speed = 5
  		@vision = "Low-Light"
  		@languages = ["Common", "Dwarven"]
  	when "Eladrin"
  		@size = "Medium"
  		@speed = 6
  		@vision = "Low-Light"
  		@languages = ["Common", "Elven"]
  	when "Elf"
  		@size = "Medium"
  		@speed = 7
  		@vision = "Low-Light"
  		@languages = ["Common", "Elven"]
  	when "Half-Elf"
  		@size = "Medium"
  		@speed = 6
  		@vision = "Low-Light"
  		@languages = ["Common", "Elven"]
  	when "Halfling"
  		@size = "Small"
  		@speed = 6
  		@vision = "Normal"
  		@languages = ["Common"]
  	when "Human"
  		@size = "Medium"
  		@speed = 6
  		@vision = "Normal"
  		@languages = ["Common"]
  	else
  		@size = "Medium"
  		@speed = 6
  		@vision = "Low-Light"
  		@languages = ["Common"]
  	end
  end

end
