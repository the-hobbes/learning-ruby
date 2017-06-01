#!/usr/bin/ruby

# Info from https://en.wikibooks.org/wiki/Ruby_Programming/Hello_world
print "Hello HackerRank!!\n"

puts 'Hello, world!'

# you can also run ruby in evaluate mode, so no text file:
# ruby -e "puts 'Hello world'"

=begin
You can also source ruby in the script like python, and
then execute it by setting the executable bit and calling it
with the ./
The shebang line is:
#!/usr/bin/ruby
=end

=begin
The current directory isn't searched for executables unless
it is on the PATH. You can:
1) Make ruby scripts in a dir on the PATH already
2) Add the current dir to the PATH
3) Specify the current dir each time you run your script
(this is what ./ signifies)

Its also common to create a ~/bin dir, add this to the PATH,
and move completed scripts there so they can be run from anywhere
e.g., $ hello_world.rb
=end

=begin
Puts vs Print
Puts automatically inserts a newline at the end of the string being
printed, whereas print does not.
=end

print self
