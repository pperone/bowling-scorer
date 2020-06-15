# frozen_string_literal: true

class Frame
  def initialize(box_1, box_2, box_3=nil)
    @box_1 = box_1
    @box_2 = box_2
    @box_3 = box_3
    @total = 0
  end

  def spare?
    box_2 == '/'
  end

  def strike?
    box_2 == 'X'
  end

  def final_frame?
    !box_3.nil?
  end

  def first_throw
    return 10 if strike?

    box_1.to_i
  end

  def inner_total
    return 10 if strike? || spare?

    box_1.to_i + box_2.to_i + box_3.to_i
  end

  attr_accessor :box_1, :box_2, :box_3, :total
end
