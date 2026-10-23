# @before_compile runs a macro at the end of a module body, after all
# attributes accumulated by earlier code are known.
defmodule HandlerRegistry do
  defmacro __using__(_opts) do
    quote do
      Module.register_attribute(__MODULE__, :handlers, accumulate: true)
      import HandlerRegistry, only: [handler: 1]
      @before_compile HandlerRegistry
    end
  end

  defmacro handler(name) do
    quote do
      @handlers unquote(name)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def handlers, do: Enum.reverse(@handlers)
      def count, do: length(@handlers)
    end
  end
end

defmodule Router do
  use HandlerRegistry

  handler :index
  handler :show
  handler :create

  def hello, do: :world
end

IO.inspect(Router.handlers())
IO.inspect(Router.count())
IO.inspect(Router.hello())
