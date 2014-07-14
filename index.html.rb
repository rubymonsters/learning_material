<h2>Hi, play with me! Guess the secret word to save the little man.</h2>

  <p>Bad guesses till now: <%= @bad_guesses %></p>



  <form action="/take_guess" method="POST">
        <label>Letter:</label>
        <input name="guess" type="text">
      
        <button type="submit">Use this letter</button>
  </form> 
  <p>
  <% @letters.each do |l| %>
      <% if @guessed_letters.include? l %>
      <%= l %>
      <% else %>
      _
      <% end %>

  <% end %></p>
