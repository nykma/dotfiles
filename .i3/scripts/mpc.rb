#!/usr/bin/env ruby
# Copyright 2016 Nyk Ma <moe@nayuki.info>
# Licensed under the terms of the MIT license.
#
# This script outputs current MPD status using MPC, and should be
# used with i3blocks.
#
# Help yourself by editing `full_text`.
#
# Use FontAwesome to show eye-candy icons properly.
# https://fortawesome.github.io/Font-Awesome/cheatsheet/

mpc_output = `mpc -h ~/.config/mpd/socket | grep -v '^volume:'`.split(/\n/)
if mpc_output.length == 0
  puts ' Stopped', ' Stopped', '#FF7300'
  exit
end
# ["takanax - Zap Your Channel", "[playing] #2/8   0:02/6:09 (0%)"]
artist,  title = mpc_output.first.split(' - ')
status, track_number,   time,   progress = mpc_output.last.split()
status.gsub!(/[\[\]]/, '')
current_time, total_time = time.split('/')
current_track, total_track = track_number.gsub(/#/, '').split('/')

status_icon = ''
status_color = ''
case status
when 'playing'
  status_icon = ''
  status_color = '#A8FF00'
when 'paused'
  status_icon = ''
  status_color = '#FFF600'
end

full_text = "#{status_icon} #{artist} - #{title}"

puts full_text, full_text, status_color
exit
