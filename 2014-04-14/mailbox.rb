class Mailbox
	def initialize(owner)
	@owner = owner
	@emails = []
	end

	#  or attr_reader :owner, instead of the def below

	def owner
		@owner
	end

	def capitalize_mail(name)
		name.capitalize
	end

	def emails
		@emails
	end

	#methods retur the last line of code in the method


end

#Email class should have @from and @subject, @body - those are strings and @headers (hash)
class Email
	def initialize(from, subject, body, headers)
		@from = from
		@subject = subject
		@body = body
		@headers = headers
	end

	attr_reader :from, :subject, :body, :headers

	def header(key)
		@headers[key.capitalize]
	end
end

anne = Mailbox.new("Anne")
puts anne # in terminal, you'll see the number of a new object


private_email = Email.new("anne@web.de", "how are you?", "hey Anne, wanna go for a drink tonight?", {"to" => "kacper@o2.pl",
	"picture" => "smile"})

work_email = Email.new("matti@web.de", "hi", "hello there!", {})

anne.emails << private_email # adding private_email to the an empty array
puts anne.emails 
