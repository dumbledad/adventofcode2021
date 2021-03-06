# frozen_string_literal: true

require './day17'

# https://adventofcode.com/2021/day/17
RSpec.describe ProbeLauncher do
  description = 'target area: x=20..30, y=-10..-5'
  describe '#parse_target_description' do
    it 'correctly parses the target description string into [x_min, x_max, y_min, y_max] array' do
      launcher = ProbeLauncher.new(description)
      expect(launcher.target).to eq([20, 30, -10, -5])
    end
  end

  describe '#sensible_direction_bounds' do
    it 'correctly finds sensible bounds for the direction' do
      launcher = ProbeLauncher.new(description)
      bounds = launcher.sensible_direction_bounds
      expect(bounds).to eq([6, 30, -10, 10])
    end
  end

  describe '#max_y_reached' do
    it 'correctly finds the maxumum y possible while still hitting target' do
      launcher = ProbeLauncher.new(description)
      max_y = launcher.max_y_reached
      expect(max_y).to eq(45)
    end
  end

  describe '#on_target_probe_count' do
    it 'correctly finds the number of probes which hit the target' do
      launcher = ProbeLauncher.new(description)
      count = launcher.on_target_probe_count
      expect(count).to eq(112)
    end
  end
end

RSpec.describe Probe do
  describe '#in_target?' do
    it 'correctly checks that position is in target' do
      probe = Probe.new([0, 0], [6, 9], [20, 30, -10, -5])
      probe.position = [21, -10]
      in_target = probe.in_target?
      expect(in_target).to eq(true)
    end
  end

  describe '#visualize_trajectory' do
    it 'correctly draws the trajectory grid' do
      probe = Probe.new([0, 0], [1, 1], [4, 5, -3, -2])
      probe.trajectory = [[0, 0], [1, 1], [2, 0], [3, -1], [4, -2], [5, -3]]
      probe.max_y_reached = 1
      grid = probe.visualize_trajectory
      expected =
        [
          '.*....',
          '*.*...',
          '...*..',
          '....*T',
          '....T*'
        ]
      expect(grid).to eq(expected)
    end
  end
end
