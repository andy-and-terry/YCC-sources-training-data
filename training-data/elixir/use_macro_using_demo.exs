defmodule Loggable do
  defmacro __using__(opts) do
    prefix = Keyword.get(opts, :prefix, "LOG")

    quote do
      def log(msg), do: IO.puts("[#{unquote(prefix)}] #{msg}")
    end
  end
end

defmodule Service do
  use Loggable, prefix: "SVC"

  def run, do: log("running")
end

Service.run()
