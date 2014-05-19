# Task:
# 1. 
# create a class mailbox with owner and emails
# create a class mail with variables from, subject, headers, body
# 2.
# create a method that returns the sender (emails_from)
# create a method that returns the recipient (emails_to)
# 3. write testmethods for emails_from and emails_to


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
end

class Email
	def initialize(from, subject, headers, body)
		@from = from
		@subject = subject
		@headers = headers
		@body = body
	end
	def from
		@from  # this kind of method is called "attribute reader"
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
	def to  # called in line 29
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

def test_emails_knows_recipient(email, to)
  expected = to
  actual = email.to
  expected == actual
end

def test_mailbox_emails_from(email, mailbox)
	expected = [email]
	actual = mailbox.emails_from(email.from)
	expected == actual
end

def test_mailbox_emails_to(email, mailbox)
	expected = [email]
	actual = mailbox.emails_to(email.to)
	expected == actual
end

if test_emails_knows_recipient(email4, "Elisa") 
  puts "test_emails_knows_recipient passed"
else
  puts "test_emails_knows_recipient failed"
end

if test_mailbox_emails_from(email1, elisas_mailbox)
	puts "test_mailbox_emails_from passed"
else
	puts "test_mailbox_emails_from failed"
end

if test_mailbox_emails_to(email2, elisas_mailbox)
	puts "test_mailbox_emails_to passed"
	else
	puts "test_mailbox_emails_to failed"
end

# procedure for writing a new method:
# express expected result as a test
# run test and read error messages while improving the code
# create a method
# write the method
# test now passes

# HOMEWORK:
# read about minitest (google) and try to convert tests above in minitests
