module MultiPart

  class MultiPartStream

    def initialize(multi_parts)
      @multi_parts        = multi_parts
      @multi_part_no      = 0
      @multi_part_offset  = 0
    end

    def size
      total = 0
      @multi_parts.each { |part| total += part.size }
      total
    end

    def read(how_much)
      return if @multi_part_no >= @multi_parts.size

      how_much_current_part = @multi_parts[@multi_part_no].size - @multi_part_offset
      how_much_current_part = how_much_current_part > how_much ? how_much : how_much_current_part

      how_much_next_part    = how_much - how_much_current_part
      current_part          = @multi_parts[@multi_part_no].read(@multi_part_offset, how_much_current_part)

      if how_much_next_part > 0
        @multi_part_no     += 1
        @multi_part_offset  = 0
        next_part           = read(how_much_next_part)
        current_part + next_part ? next_part : ''
      else
        @multi_part_offset += how_much_current_part
        current_part
      end
    end
  end
end
