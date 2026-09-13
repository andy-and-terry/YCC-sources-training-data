let
  user = { name = "Ada"; age = 32; role = "Engineer"; };

  renderCard = u: ''
    Name: ${u.name}
    Age: ${toString u.age}
    Role: ${u.role}
  '';

  greeting = "Hi ${user.name}, you are a ${user.role}!";
in
  {
    inherit greeting;
    card = renderCard user;
  }
