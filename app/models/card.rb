class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_many :guesses

  def check_answer(answer)
    self.answer == answer
  end
end
