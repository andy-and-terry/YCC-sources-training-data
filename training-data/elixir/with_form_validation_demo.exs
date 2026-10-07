defmodule FormValidator do
  def validate_name(%{"name" => name}) when is_binary(name) and byte_size(name) > 0, do: {:ok, name}
  def validate_name(_), do: {:error, :invalid_name}

  def validate_age(%{"age" => age}) when is_integer(age) and age >= 0, do: {:ok, age}
  def validate_age(_), do: {:error, :invalid_age}

  def validate_email(%{"email" => email}) when is_binary(email) do
    if String.contains?(email, "@") do
      {:ok, email}
    else
      {:error, :invalid_email}
    end
  end

  def validate_email(_), do: {:error, :invalid_email}

  def validate(params) do
    with {:ok, name} <- validate_name(params),
         {:ok, age} <- validate_age(params),
         {:ok, email} <- validate_email(params) do
      {:ok, %{name: name, age: age, email: email}}
    else
      {:error, reason} -> {:error, reason}
    end
  end
end

good_params = %{"name" => "Ada", "age" => 30, "email" => "ada@example.com"}
negative_age = %{"name" => "Ada", "age" => -1, "email" => "ada@example.com"}
bad_email = %{"name" => "Ada", "age" => 30, "email" => "not-an-email"}

IO.inspect(FormValidator.validate(good_params))
IO.inspect(FormValidator.validate(negative_age))
IO.inspect(FormValidator.validate(bad_email))
