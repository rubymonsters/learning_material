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

	def header(key) # needed for the method emails_to
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



# -------------16.06.2014----------------

require 'erb'

class EmailsHtmlErbFormatter
	def initialize(all_emails)
		@all_emails = all_emails
	end

	attr_reader :all_emails

	def template
		File.read('emails_table.html.erb')
	end

	def format
		ERB.new(template).result(binding)
	end

end

result = EmailsHtmlErbFormatter.new(elisas_mailbox.emails).format

# -----------23.06.2014---------------

require 'rack'
require 'pp'

class App
	def initialize(env)
		@env = env
	end

	def contacts
		['200', headers, ["<h1> Contacts </h1>"]]
	end

	def headers
		{'X-Generated-By' => 'RubyMonsters', 'Content-Type' => 'text/html'}
	end
end

def	headers 
	{'X-Generated-By' => 'RubyMonsters', 'Content-Type' => 'text/html'}
end

app = lambda do |env|
	path = env['PATH_INFO']
	
	if "/emails" == path
		['200', headers, [  result  ]]
	elsif "/contacts" == path
		['200', headers, ["<h1> Contacts </h1>"]]
	else 
		['404', headers.merge('Content-Type' => 'text/plain'), ["not found"]]
	end
end

Rack::Handler::WEBrick.run app 



#lambdas are very similar to blocks = anonymous method you assign to a variable

# pp = pretty print




