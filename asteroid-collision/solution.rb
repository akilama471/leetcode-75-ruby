def asteroid_collision(asteroids)
  stack = []

  asteroids.each do |ast|
    destroyed = false

    while !stack.empty? && stack[-1] > 0 && ast < 0
      if stack[-1] < ast.abs
        # Top asteroid is smaller -> explode it and check again
        stack.pop
        next
      elsif stack[-1] == ast.abs
        # Both explode
        stack.pop
      end
      destroyed = true
      break
    end

    stack << ast unless destroyed
  end

  stack
end
