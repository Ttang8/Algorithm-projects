class DynamicProgramming

  def initialize
    @blair_cache = {1=>1,2=>2}

  end

  def blair_nums(n)
    if @blair_cache[n]
      return @blair_cache[n]
    end
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
  end

  def frog_cache_builder(n)
    @frog_cache = {1=>[[1]],2=>[[1,1],[2]],3=>[[1,1,1],[1,2],[2,1],[3]]}
    (4..n).each do |int|
      @frog_cache[int] = @frog_cache[n-1] + @frog_cache[n-2] + @frog_cache[n-3]
    end
    @frog_cache[n]
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
