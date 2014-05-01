names = ["debbie", "katja", "alicia"].collect do |name|
	name.capitalize
end

names = names.select do |name|
	name.include?("a")
end

# p names


class Mailbox
	def initialize(owner)
		@owner = owner
		@emails = []
	end
		# put data into an instance variable so the instance can keep track of it
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
end


# a new object/instance is created out of the class Mailbox named katjas_mailbox

# task:
# create an email-class
# from(string)
# subject (string)
# header (hash)
# body (string)

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

end

katjas_mailbox = Mailbox.new("Katja")
katjas_email = Email.new("Katja", "Party", {"to" => "Steve"}, "Tomorrow")
lisas_email = Email.new("Lisa", "Day Off", {"to" => "Katja"}, "Sunday")
katjas_mailbox.emails << lisas_email
katjas_mailbox.emails << katjas_email

def test_mailbox_emails_from(email, mailbox)
	expected = [email]
	actual = mailbox.emails_from(email.from)
	expected == actual
end

if test_mailbox_emails_from(lisas_email, katjas_mailbox)
	puts "test_mailbox_emails_from passed" 
else 
	puts "test_mailbox_emails_from failed"
end

# def test_mailbox_emails_to(email, mailbox)
	# expected = [email]
	# actual = mailbox.emails_to(email.from)
	# expected == actual
# end

if test_mailbox_emails_to(lisas_email, katjas_mailbox)
	puts "test_mailbox_emails_to passed" 
else 
	puts "test_mailbox_emails_to failed"
end

# Homework:
# repeat the Mailbox app in an empty file (with different values)
# make the test pass 







