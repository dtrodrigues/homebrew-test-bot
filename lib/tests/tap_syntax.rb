# frozen_string_literal: true

module Homebrew
  module Tests
    class TapSyntax < Test
      def run!
        test_header(:TapSyntax)

        test "brew", "readall", "--aliases", tap.name
        broken_xcode_rubygems = MacOS.version == :mojave &&
                                MacOS.active_developer_dir == "/Applications/Xcode.app/Contents/Developer"
        test "brew", "style", tap.name unless broken_xcode_rubygems
      end
    end
  end
end
