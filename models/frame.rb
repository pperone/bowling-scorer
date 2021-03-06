# frozen_string_literal: true

class Frame
  def initialize(box_1, box_2, box_3=nil)
    @box_1 = box_1
    @box_2 = box_2
    @box_3 = box_3
    @total = 0
  end

  def spare?
    if final_frame?
      false
    else
      box_2 == '/'
    end
  end

  def strike?
    if final_frame?
      false
    else
      box_2 == 'X'
    end
  end

  def final_frame?
    !box_3.nil?
  end

  def first_throw
    return get_value(box_1) if final_frame?
    return 10 if strike?

    box_1.to_i
  end

  def second_throw
    if box_2 == '/'
      10 - box_1.to_i
    elsif strike?
      0
    else
      get_value(box_2)
    end
  end

  def inner_total
    return 10 if strike? || spare?

    get_value(box_1) + get_value(box_2) + get_value(box_3)
  end

  def get_value(box)
    return 10 if box == 'X'
    return 0 if box == 'F'

    box.to_i
  end

  attr_accessor :box_1, :box_2, :box_3, :total
end
