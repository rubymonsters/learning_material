class Mailbox
	def initialize (owner)
		@owner = owner
		@emails = []
	end
	def owner
		@owner		
	end
	def emails
		@emails
	end
	def emails_from(from)
		@emails.select do |email|
			email.from == from
		end
	end
	def emails_to(to)
	  @emails.select do |email|
	    email.to == to
	  end
	end
	def show_emails
		puts emails.map { |email| email.subject}
	end
end

class Email
	def initialize(from, subject, headers, body)
		@from = from
		@subject = subject
		@headers = headers
		@body = body
	end
	def from
		@from  
	end
	def subject
		@subject
	end
	def headers
		@headers
	end
	def body
		@body
	end
	def to 
	  self.header("to")
	end	
	def header(key)  # needed for the method emails_to
		@headers.fetch(key)
	end
	
end



elisas_mailbox = Mailbox.new("Elisa")

email1 = Email.new("Heike", "Greetings from Lanzarote", {"to" => "Elisa"}, "Beautiful island!")
elisas_mailbox.emails << email1

email2 = Email.new("Elisa", "Saturday evening", {"to" => "Maria"}, "Let's go to the cinema.")
elisas_mailbox.emails << email2

email3 = Email.new("Maria", "Movie", {"to" => "Elisa"}, "Good idea.")
elisas_mailbox.emails << email3

email4 = Email.new("Jana", "Berlin", {"to" => "Elisa"}, "I am back in town.")
elisas_mailbox.emails << email4

#------------------from 19.05.-------------------------------------

# puts "#{email1.from} #{email1.subject} #{email1.body} #{email1.to}"

 
# puts elisas_mailbox.emails.map {|email| "|#{email.from.ljust(10)}| #{email.subject.ljust(40)}|"}
max_from = elisas_mailbox.emails.map {|email| email.from.length}.max
max_subject = elisas_mailbox.emails.map {|email| email.subject.length}.max

header = ["From", "Subject"]
line = "+#{["-" * max_from, "-" * max_subject].join("+")}+"

# puts "+#{["-" * max_from, "-" * max_subject].join("+")}+"
puts line
puts "|#{header[0].ljust(max_from)}|#{header[1].ljust(max_subject)}|"

elisas_mailbox.emails.each do |email|
	puts line
	
	# puts "+#{["-" * max_from, "-" * max_subject].join("+")}+"

	# puts "+" + ("-" * max_from) + "+" + ("-" * max_subject) + "+"
	# puts "+#{"-" * max_from}+#{"-" * max_subject}+"
	# puts ['+', "-" * max_from, '+', "-" * max_subject, '+'].join('')
	puts "|#{email.from.ljust(max_from)}|#{email.subject.ljust(max_subject)}|"
end

puts line

#------------------------from 26.05--------------------------------

class EmailTextFormatter 

	def initialize(all_emails)
		@all_emails = all_emails
	end

	def column_widths
		max_from = all_emails.map {|email| email.from.length}.max
		max_subject = all_emails.map {|email| email.subject.length}.max
		
		[max_from, max_subject]
	end

	attr_reader :all_emails

	def format 
		lines = []
		columns = ["From", "Subject"]
		lines.push(separator)
		
		lines << format_line(columns)
		
		all_emails.each do |email|
			lines << separator
			lines << format_line([email.from, email.subject])
			
		end

		lines.push(separator).join("\n")
	end

	def format_line(columns)
		
		titles = columns.each_with_index.map {|column, index| column.ljust(column_widths[index]) }
		titles.push("")
		titles.unshift("")
		titles.join("|")
	end

	def separator
		
		dashes = column_widths.map {|max| "-" * max}
		dashes.push("")
		dashes.unshift("")
		dashes.join("+")
		
	end
end

class EmailHtmlFormatter

	def initialize(all_emails)
		@all_emails = all_emails
	end

	
	attr_reader :all_emails

	def format 
		lines = []
		columns = ["From", "Subject"]
		
		lines << "<table>"
		lines << format_header(columns)
		
		all_emails.each do |email|
			lines << format_line([email.from, email.subject])
		end

		lines << "</table>"
		lines.join("\n")
	end

	def format_header(columns)
		"<tr><th>" + columns.join("</th><th>") + "</th></tr>"
	end

	def format_line(columns)
		"<tr><td>" + columns.join("</td><td>") + "</td></tr>"
	end
	
end

puts EmailTextFormatter.new(elisas_mailbox.emails).format
puts EmailHtmlFormatter.new(elisas_mailbox.emails).format

# writing it to the file
html = EmailHtmlFormatter.new(elisas_mailbox.emails).format
File.open("emails.html", "w+") { |file| file.write(html)}


require 'minitest/autorun'

class TestEmailHtmlFormatter < MiniTest::Unit::TestCase
	def setup 
		email1 = Email.new("Heike", "Greetings from Lanzarote", {"to" => "Elisa"}, "Beautiful island!")
		@emails = [email1]
	end

	def test_format
		formated = EmailHtmlFormatter.new(@emails).format
		html = "<table>\n" +
			   "<tr><th>From</th><th>Subject</th></tr>\n" +
			   "<tr><td>Heike</td><td>Greetings from Lanzarote</td></tr>\n" +
			   "</table>"
		assert_equal formated, html
	end

	
end 
