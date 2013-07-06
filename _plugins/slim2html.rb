require "slim"
Slim::Engine.set_default_options pretty: true

module Jekyll

  class Slim2Html < Generator
    def generate(_)
      Dir.glob('**/*.slim') do |slim_file_name|
        next unless changed? slim_file_name

        open(slim_file_name) do |file|
          slim_source = file.read
          html_file_name = slim_file_name.gsub('/slim', '')
                                         .gsub('.slim', '.html')

          html_file = File.new html_file_name, 'w'
          html_file.write Tilt['slim'].new { slim_source }.render
          html_file.close
        end
      end
    end
  end
end

def changed?(filename)
  Time.now - File.ctime(filename) < 1.0001
end
