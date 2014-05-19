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
	def initialize (from, subject, headers, body)
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

	def header(key)
		@headers.fetch(key)
	end


end



katjas_mailbox = Mailbox.new("Katja")
katjas_email = Email.new("Katja", "Party", {"to" => "Steve"}, "Tomorrow")
lisas_email = Email.new("Lisa", "Day Off", {"to" => "Kate"}, "Sunday")
katjas_mailbox.emails << lisas_email
katjas_mailbox.emails << katjas_email



require 'minitest/autorun'

class TestMailbox < MiniTest::Unit::TestCase
	def setup
		@inbox = Mailbox.new("name")
	end
	def test_mailbox_emails_from
		 email = Email.new("Katja", "Party", {"to" => "Steve"}, "Tomorrow")
		 @inbox.emails << email
		 assert_equal [email], @inbox.emails_from("Katja")		
	end

	def test_mailbox_emails_from_only_return_requested_from
		 email = Email.new("Katja", "Party", {"to" => "Steve"}, "Tomorrow")
		 @inbox.emails << email
		 assert_equal [], @inbox.emails_from("Steve")				
	end

	def test_mailbox_emails_to
		email = Email.new("Katja", "Party", {"to" => "Steve"}, "Tomorrow")
		@inbox.emails << email
		assert_equal [email], @inbox.emails_to("Steve")
	end

	def test_mailbox_emails_to_only_return_requested_to
		email = Email.new("Katja", "Party", {"to" => "Steve"}, "Tomorrow")
		@inbox.emails << email
		assert_equal [], @inbox.emails_to("Katja")
	end	
end 

