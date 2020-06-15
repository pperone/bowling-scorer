# frozen_string_literal: true

class Frame
  def initialize(box_1, box_2, total)
    @box_1 = box_1
    @box_2 = box_2
    @total = total
  end

  def spare?
    (total == 10) && (box_2.to_i - box_1.to_i < 10)
  end

  def strike?
    (total == 10) && (box_2.to_i - box_1.to_i == 10)
  end

  attr_accessor :box_1, :box_2, :total
end
