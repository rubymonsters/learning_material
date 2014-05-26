class Mailbox
	def initialize (owner)
		@owner = owner
		@emails = []
	end	
		#put data into an instance variable so the instance can keep track of it
	def owner   # method = attribute reader
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




class EmailsTextFormatter 
	def initialize(emails)
		@emails = emails
	end	

	def max_from
		@emails.map{|email| email.from.length}.max
	end	
	def max_to
		@emails.map{|email| email.to.length}.max
	end	
		
	def max_subject
		@emails.map{|email| email.subject.length}.max
	end
	def max_body
		@emails.map{|email| email.body.length}.max
	end	
			
	def header
		header = ["From", "Subject", "To", "Body"]
		line = "|#{header[0].center(max_from)}|#{header[1].center(max_subject)}|#{header[2].center(max_to)}|#{header[3].center(max_body)}|"
		[self.margin, line, margin]
	end	
	def margin
		"+#{["-" * max_from, "-" * max_subject, "-" * max_to, "-" * max_body].join("+")}+"
	end

	def body
		separator = "+#{["-" * max_from, "-" * max_subject, "-" * max_to, "-" * max_body].join("+")}+" #closure
		@emails.map do |email|
			line = "|#{email.from.ljust(max_from)}|#{email.subject.ljust(max_subject)}|#{email.to.ljust(max_to)}|#{email.body.ljust(max_body)}|"
			[line, separator]
		end.flatten
		
	end

	def format
		#table = header + body
		#table.join("\n")
		header.concat(body).join("\n") 
	end	
end	


formatter = EmailsTextFormatter.new(katjas_mailbox.emails)
#puts formatter.header.join("\n")
#puts formatter.body.join("\n")
puts formatter.format
#puts formatter.body



